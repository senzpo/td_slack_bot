# frozen_string_literal: true

class Web::GitlabMergeRequestsController < ApplicationController
  def index
    @merge_requests = Gitlab::MergeRequest.all.sort
  end
end
