# frozen_string_literal: true

class Api::GitlabMergeRequestsController < ApplicationController
  def index
    project = GitlabHelper.project
    merge_requests = GitlabHelper.get_merge_requests.to_json

    render json: {merge_requests: merge_requests}
  end
end
