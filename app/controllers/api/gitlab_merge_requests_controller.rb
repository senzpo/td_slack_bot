# frozen_string_literal: true

class Api::GitlabMergeRequestsController < ApplicationController
  def index
    merge_requests = Gitlab::MergeRequest.all
    render json: merge_requests.to_json
  end

  def refresh
    raw_merge_requests = GitlabHelper.get_merge_requests
    GitlabMergeRequests::Refresh.perform(raw_merge_requests)
  end
end
