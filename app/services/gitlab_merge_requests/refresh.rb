# frozen_string_literal: true

class GitlabMergeRequests::Refresh
  class TaxdomeMemberDoesNotExist < StandardError; end;
  def self.perform(raw_merge_requests)
    errors = []
    raw_merge_requests.each do |rmr|
      params = {
        external_id: rmr['iid'],
        title: rmr['title'],
        project_id: rmr['project_id'],
        author: rmr['author']['name'],
        state: rmr['state'],
        created_on: rmr['created_at'],
        updated_on: rmr['updated_at']
      }


      slack_taxdome_member = Slack::TaxdomeMember.by_display_name(params[:author]).first

      if slack_taxdome_member.blank? 
        errors << "Slack member #{params[:author]} does not exist"
        next
      end

      if slack_taxdome_member.present?
        params[:slack_taxdome_member_id] = slack_taxdome_member.id
      end

      merge_request = Gitlab::MergeRequest.find_or_initialize_by(external_id: rmr['iid'])
      is_new_record = merge_request.new_record?

      Gitlab::MergeRequest.transaction do
        merge_request.update!(params)

        if is_new_record
          merge_request.merge_request_events.create!(status: params[:state], produced_at: params[:created_on])
        elsif merge_request.state != params[:state]
          merge_request.merge_request_events.create!(status: params[:state], produced_at: params[:updated_on])
        end
      end

      # TODO: implement some response
    end
    if errors.any?
      raise TaxdomeMemberDoesNotExist, errors
    end
  end
end
