# frozen_string_literal: true

module Web
  class GitlabMergeRequestsController < ApplicationController
    def index
      @merge_requests = Gitlab::MergeRequest.all.sort
    end
  end
end
