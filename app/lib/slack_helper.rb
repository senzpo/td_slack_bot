# frozen_string_literal: true

class SlackHelper
  SLACK_BOT_NAME = 'Slackbot'
  class << self
    def taxdome_members
      slack_client = Slack::Web::Client.new
      slack_client.users_list.members.select { |m| !m.is_bot && !m.deleted && m.real_name != SLACK_BOT_NAME }
    end
  end
end
