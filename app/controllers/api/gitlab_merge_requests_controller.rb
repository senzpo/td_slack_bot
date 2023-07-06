# frozen_string_literal: true

module Api
  class GitlabMergeRequestsController < ApplicationController
    def index
      raw_merge_requests = GitlabHelper.get_merge_requests
      merge_requests = raw_merge_requests.map do |merge_request|
        {
          id: merge_request['iid'],
          project_id: merge_request['project_id'],
          title: merge_request['title'],
          state: merge_request['state'],
          author: merge_request['author']['name'],
          reviewers: merge_request['reviewers'].map(&:name)
        }
      end

      render json: { merge_requests: merge_requests.to_json }
    end
  end
end
