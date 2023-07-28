# frozen_string_literal: true

module Web
  class GitlabMergeRequestEventsController < ApplicationController
    def index
      @merge_request_events = Gitlab::MergeRequestEvent.all.order(gitlab_merge_request_id: :desc)
    end
  end
end
