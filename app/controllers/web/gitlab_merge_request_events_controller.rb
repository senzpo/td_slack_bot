# frozen_string_literal: true

module Web
  class GitlabMergeRequestEventsController < ApplicationController
    def index
      @merge_request_events = Gitlab::MergeRequestEvent.ordered_by_newest
    end
  end
end
