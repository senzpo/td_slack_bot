# frozen_string_literal: true

class SlackHelper
  class << self
    def taxdome_members
      slack_bot_name = "Slackbot"

      slack_client = Slack::Web::Client.new
      slack_client.users_list.members.select { |m| !m.is_bot && !m.deleted && m.real_name != slack_bot_name }
    end
  end
end
