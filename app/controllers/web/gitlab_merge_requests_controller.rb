# frozen_string_literal: true

module Web
  class GitlabMergeRequestsController < ApplicationController
    def index
      @merge_requests = Gitlab::MergeRequest.ordered_by_newest.preload(:taxdome_member).ransack(params[:q]).result
      @merge_requests = @merge_requests.page(params[:page])
    end

    def show
      @merge_request = Gitlab::MergeRequest.find params[:id]
    end
  end
end
