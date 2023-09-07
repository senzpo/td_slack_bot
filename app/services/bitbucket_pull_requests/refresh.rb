# frozen_string_literal: true

module BitbucketPullRequests
  class Refresh
    def self.perform
      BitbucketHelper.pull_requests.each do |pr|
        params = pr.attributes.slice(:title, :state, :created_on, :updated_on)
        params[:external_id] = pr.id
        params[:display_name] = pr.author['display_name']

        slack_taxdome_member = Slack::TaxdomeMember.by_display_name(params[:display_name]).first
        if slack_taxdome_member.present?
          params[:slack_taxdome_member_id] = slack_taxdome_member.id
        end

        Bitbucket::PullRequest.transaction do
          pull_request = Bitbucket::PullRequest.find_or_initialize_by(external_id: pr.id)

          is_new_record = pull_request.new_record?

          pull_request.update!(params)

          if is_new_record
            pull_request.pull_request_events.create!(status: params[:state], produced_at: params[:created_on])
          elsif pull_request.state != params[:state]
            pull_request.pull_request_events.create!(status: params[:state], produced_at: params[:updated_on])
          end
        end
      end
    end
  end
end
