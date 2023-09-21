# frozen_string_literal: true

require 'delegate'

class SlackHelper
  SCOPE_LIMIT = 1_000
  SLACK_BOT_NAME = 'Slackbot'

  CHANNELS = {
    service_team: 'service_team',
    investigation: 'investigation',
    urgent: 'urgent',
    security_reports: 'security_reports',
    production_errors: 'production_errors',
    test: 'fyi_bot_hackathon'
  }.freeze

  DONE_REACTION = %w[white_check_mark heavy_check_mark x].freeze
  PROGRESS_REACTION = %w[eyes heavy_plus_sign].freeze

  class Message < SimpleDelegator
    def resolved?
      has_reaction? && (DONE_REACTION && reactions.map(&:name)).any?
    end

    def in_progress?
      !resolved? && has_reaction? && (PROGRESS_REACTION && reactions.map(&:name)).any?
    end

    def opened?
      !resolved?
    end

    def has_reaction?
      respond_to?(:reactions) && reactions.present?
    end
  end

  attr_reader :slack_client

  def initialize
    @slack_client = Slack::Web::Client.new
  end

  def taxdome_members
    slack_client.users_list.members.select { |m| !m.is_bot && !m.deleted && m.real_name != SLACK_BOT_NAME }
  end

  def messages(channel, limit: SCOPE_LIMIT, oldest: 1.month.ago)
    slack_client
      .conversations_history(channel: channel.id, limit:, oldest: oldest.to_i)
      .messages
      .filter { |m| m.subtype.nil? }
      .map { |m| Message.new(m) }
  end

  def channel_by_name(name)
    all_channels.find { |c| c.name == name }
  end

  def urgent_channel
    channel_by_name(CHANNELS[:urgent])
  end

  def investigation_channel
    channel_by_name(CHANNELS[:investigation])
  end

  def service_team_channel
    channel_by_name(CHANNELS[:service_team])
  end

  def security_reports_channel
    channel_by_name(CHANNELS[:security_reports])
  end

  private

  def all_channels
    @all_channels ||= slack_client.conversations_list(limit: SCOPE_LIMIT).channels
  end
end
