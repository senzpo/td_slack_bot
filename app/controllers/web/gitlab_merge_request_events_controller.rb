# frozen_string_literal: true

module Web
  class GitlabMergeRequestEventsController < ApplicationController
    def index
      @merge_request_events = Gitlab::MergeRequestEvent.all.sort
    end
  end
end
