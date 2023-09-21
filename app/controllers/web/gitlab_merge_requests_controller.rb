# frozen_string_literal: true

module Web
  class GitlabMergeRequestsController < ApplicationController
    def index
      @merge_requests = Gitlab::MergeRequest.active.ordered_by_newest.preload(:taxdome_member)
    end

    def show
      @merge_request = Gitlab::MergeRequest.find params[:id]
    end
  end
end
