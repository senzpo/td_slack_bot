# frozen_string_literal: true

module Slack
  module Channels
    class PublishServiceTeamStats
      SLA_LIMIT_DAYS_FOR = {
        urgent: 1,
        investigation: 3,
        security_reports: 5,
        production_errors: 5
      }.freeze

      def self.perform
        slack_helper = SlackHelper.new
        overdue_urgent_topics = overdue_topics(slack_helper.urgent_channel, SLA_LIMIT_DAYS_FOR[:urgent])
        overdue_investigation_topics = overdue_topics(slack_helper.investigation_channel,
                                                      SLA_LIMIT_DAYS_FOR[:investigation])
        overdue_security_topics = overdue_topics(slack_helper.security_reports_channel,
                                                 SLA_LIMIT_DAYS_FOR[:security_reports])
        overdue_production_errors = overdue_topics(slack_helper.urgent_channel, SLA_LIMIT_DAYS_FOR[:production_errors])

        # https://api.slack.com/methods/chat.getPermalink
        # collect links^^
      end

      private

      def overdue_topics(channel, days_limit)
        slack_helper
          .messages(channel)
          .filter(&:opened?)
          .filter { |message| business_days_left(Time.zone.at(message.ts.to_f)) > days_limit }
      end

      def business_days_left(date)
        CalendarHelper.business_days_between(date, Time.current)
      end

      def slack_helper
        @slack_helper ||= SlackHelper.new
      end
    end
  end
end
