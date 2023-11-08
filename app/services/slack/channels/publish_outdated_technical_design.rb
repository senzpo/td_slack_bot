# frozen_string_literal: true

module Slack
  module Channels
    class PublishOutdatedTechnicalDesign
      class << self
        include ApplicationHelper

        def perform
          requests = Gitlab::MergeRequest.opened.ordered_by_oldest.filter { |r| !r.draft? }
          return if requests.blank?

          slack_helper = SlackHelper.new
          channel = slack_helper.devsonly_channel

          authors_with_requests = requests.reduce('') do |memo, request|
            memo += "\n   • <@#{request.taxdome_member.external_id}>  <#{gitlab_mr_url(request.external_id)}|#{request.title}>"
            memo
          end

          topic = [
            {
              type: 'header',
              text: {
                type: 'plain_text',
                text: 'Technical Design online review',
                emoji: true
              }
            },
            {
              type: 'section',
              text: {
                type: 'mrkdwn',
                text: "Привет Devs Team :wave: \n По понедельникам мы проводим online review накопившихся <https://gitlab.taxdome.dev/taxdome/docs/tech-design/-/merge_requests|технических дизайнов>(событие в календаре, вход свободный :slightly_smiling_face:). Мы ожидаем, что будет собран кворум, который позволит принять решение по всем спорным моментам.\n *Задача ревьюверов:* ознакомиться с открытыми дизайнами, подготовить список предложений и замечаний. \n *Задача авторов:* присоединиться к онлайн ревью, закрыть ПР или перевести в черновик."
              }
            },
            {
              type: 'section',
              text: {
                type: 'mrkdwn',
                text: "Сегодня на ревью приглашаются: #{authors_with_requests}"
              }
            }
          ]

          slack_helper.post_message(channel.id, blocks: topic)
        end
      end
    end
  end
end
