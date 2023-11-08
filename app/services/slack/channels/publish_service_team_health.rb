# frozen_string_literal: true

module Slack
  module Channels
    class PublishServiceTeamHealth
      class << self
        include ApplicationHelper

        def perform
          stats = Slack::Channels::GetServiceTeamStats.perform
          return if stats.values.all?(&:blank?)

          slack_helper = SlackHelper.new
          # channel = slack_helper.service_team_channel
          # investigation_channel
          channel = slack_helper.test_channel

          topic = [
            {
              type: 'header',
              text: {
                type: 'plain_text',
                text: 'Service Team health check',
                emoji: true
              }
            },
            {
              type: 'section',
              text: {
                type: 'mrkdwn',
                text: "Привет TD Service Team :wave: \n Это дружеское напоминание про <https://taxdome.atlassian.net/wiki/spaces/TAXDOME/pages/224591931/ST|приоритезацию задач>. Похоже, что немного затянулись сроки разбора некоторых задач. Помните, что всегда можно призвать на помощь <https://taxdome.atlassian.net/wiki/spaces/TAXDOME/pages/322240729/ST+Cluster+Support+track|дежурных> в кластерах или попросить помощи на техническом синке :magic_wand: \n \n *Просьба обратить внимание:*"
              }
            }
          ]

          add_messages_block(topic, 'Overdue #urgent', stats[:overdue_urgent_topics], slack_helper.urgent_channel, slack_helper) if stats[:overdue_urgent_topics].any?
          add_messages_block(topic, 'Overdue #investigation', stats[:overdue_investigation_topics], slack_helper.investigation_channel, slack_helper) if stats[:overdue_investigation_topics].any?
          add_messages_block(topic, 'Overdue #security_reports', stats[:overdue_security_topics], slack_helper.security_reports_channel, slack_helper) if stats[:overdue_security_topics].any?

          slack_helper.post_message(channel.id, blocks: topic)
        end

        def add_messages_block(topic, header_text, messages, link_to_channel, slack_client)
          topic <<	{
            type: 'divider'
          }

          issues = messages.reduce('') do |memo, message|
            link = slack_client.link_to_message(link_to_channel, message.ts)
            memo += "\n   • <#{link}|#{message.text}> *#{I18n.l(Time.zone.at(message.ts.to_f), format: :long)}* #{message.reply_users_count} replies"
            memo
          end

          topic << {
            type: 'section',
            text: {
              type: 'mrkdwn',
              text: "#{header_text} \n #{issues}"
            }
          }
        end
      end
    end
  end
end
