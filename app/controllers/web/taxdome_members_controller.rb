class Web::TaxdomeMembersController < ApplicationController
    def index
        slack_client = Slack::Web::Client.new
        existing_td_members_without_bots = slack_client.users_list.members.select {|m| !m.is_bot && !m.deleted }
        @td_members = existing_td_members_without_bots
    end
end