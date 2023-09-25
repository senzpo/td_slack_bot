# frozen_string_literal: true

module Web
  class ServiceTeamsController < ApplicationController
    def show
      @stats = Slack::Channels::GetServiceTeamStats.perform
    end
  end
end
