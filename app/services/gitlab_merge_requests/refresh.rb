# frozen_string_literal: true

class GitlabMergeRequests::Refresh
  def self.perform(raw_merge_requests)
    raw_merge_requests.each do |rmr|
      params = { iid: rmr['iid'], title: rmr['title'], project_id: rmr['project_id'], state: rmr['state'] }

      merge_request = Gitlab::MergeRequest.find_by(iid: rmr['iid'])
      if merge_request.blank?
        Gitlab::MergeRequest.create!(params)
      else
        merge_request.update!(params)
      end
    end
  end
end
