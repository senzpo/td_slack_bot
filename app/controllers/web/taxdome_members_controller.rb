# frozen_string_literal: true

module Web
  class TaxdomeMembersController < ApplicationController
    def index
      slack_client = Slack::Web::Client.new
      @taxdome_members = slack_client.users_list.members.select { |m| !m.is_bot && !m.deleted && m.real_name != 'Slackbot' }
    end
  end
end
