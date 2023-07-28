# frozen_string_literal: true

module Web
  class GitlabMergeRequestsController < ApplicationController
    def index
      @merge_requests = Gitlab::MergeRequest.all.order(external_id: :desc)
    end

    def show
      @merge_request_events = Gitlab::MergeRequestEvent.where(gitlab_merge_request_id: params[:id])
    end
  end
end
