# frozen_string_literal: true

class GitlabMergeRequests::Refresh
  def self.perform(raw_merge_requests)
    raw_merge_requests.each do |rmr|
      params = {
        external_id: rmr['iid'],
        title: rmr['title'],
        project_id: rmr['project_id'],
        state: rmr['state'],
        created_on: rmr['created_at'],
        updated_on: rmr['updated_at']
      }

      merge_request = Gitlab::MergeRequest.find_or_initialize_by(external_id: rmr['iid'])
      is_new_record = merge_request.new_record?
      state_before_update = merge_request.state

      Gitlab::MergeRequest.transaction do
        merge_request.update!(params)

        if is_new_record
          merge_request.merge_request_events.create!(status: params[:state], produced_at: params[:created_on])
        elsif state_before_update != params[:state]
          merge_request.merge_request_events.create!(status: params[:state], produced_at: params[:updated_on])
        end
      end

      # TODO: implement some response
    end
  end
end
