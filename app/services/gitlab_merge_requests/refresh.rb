# frozen_string_literal: true

module GitlabMergeRequests
  class Refresh
    class TaxdomeMemberDoesNotExist < StandardError; end

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

        params[:slack_taxdome_member_id] = slack_taxdome_member.id if slack_taxdome_member.present?

        merge_request = Gitlab::MergeRequest.find_or_initialize_by(external_id: rmr['iid'])
        is_new_record = merge_request.new_record?
        was_draft = is_new_record ? nil : merge_request.draft?
        state_before_update = merge_request.state

        Gitlab::MergeRequest.transaction do
          merge_request.update!(params)
          was_draft = merge_request.draft? if was_draft.nil?

          if is_new_record
            merge_request.merge_request_events.create!(status: params[:state],
                                                       produced_at: params[:created_on],
                                                       draft: merge_request.draft?)
          elsif state_before_update != params[:state] || merge_request.draft? != was_draft
            merge_request.merge_request_events.create!(status: params[:state],
                                                       produced_at: params[:updated_on],
                                                       draft: merge_request.draft?)
          end
        end

        # TODO: implement some response
      end
      return unless errors.any?

      raise TaxdomeMemberDoesNotExist, errors
    end
  end
end
