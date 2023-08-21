# frozen_string_literal: true

module Api
  class TaxdomeMembersController < ApplicationController
    def index
      slack_client = Slack::Web::Client.new
      taxdome_members = slack_client.users_list.members.select { |m| !m.is_bot && !m.deleted && m.real_name != 'Slackbot' }
      render json: taxdome_members.to_json
    end

    def refresh
      SlackTaxdomeMembers::Refresh.perform
      render json: { success: true }
    end
  end
end
