# frozen_string_literal: true

module Web
  class TaxdomeMembersController < ApplicationController
    def index
      slack_client = Slack::Web::Client.new
      @td_members = slack_client.users_list.members
    end
  end
end
