# frozen_string_literal: true

module GitlabMergeRequests
  class Refresh
    def self.perform(raw_merge_requests)
      raw_merge_requests.each do |rmr|
        params = {
          iid: rmr['iid'],
          title: rmr['title'],
          project_id: rmr['project_id'],
          state: rmr['state']
        }

        merge_request = Gitlab::MergeRequest.find_or_initialize_by(iid: rmr['iid'])
        merge_request.update!(params)
      end
    end
  end
end
