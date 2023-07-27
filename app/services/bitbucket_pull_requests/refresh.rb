# frozen_string_literal: true

module BitbucketPullRequests
  class Refresh
    def self.perform
      BitbucketHelper.pull_requests.each do |pr|
        params = pr.attributes.slice(:title, :state, :created_on, :updated_on)
        params[:external_id] = pr.id
        params[:display_name] = pr.author['display_name']

        Bitbucket::PullRequest.transaction do
          pull_request = Bitbucket::PullRequest.find_or_initialize_by(external_id: pr.id )
          pull_request.update!(params)
          if pull_request.new_record?
            pull_request.pull_request_events.create(status: params[:state], produced_at: params[:created_on])
          elsif pull_request.state != params[:state]
            pull_request.pull_request_events.create(status: params[:state], produced_at: params[:updated_on])
          end
        end
      end
    end
  end
end
