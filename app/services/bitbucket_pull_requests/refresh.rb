# frozen_string_literal: true

class BitbucketPullRequests::Refresh
  def self.perform
    BitbucketLib.pull_requests.each do |pr|
      next if pr.title =~ /\[WIP\]/ || pr.title !~ /\bTD\b/

      params = pr.attributes.slice(:id, :title, :state, :created_on, :updated_on)
      params[:issues] = pr.title.match(/TD-(\d+)/)[1]
      params[:author] = pr.author['display_name']

      puts params

      pull_request = Bitbucket::PullRequest.find_or_create_by({ id: pr.id })
      pull_request.update!(params)
    end
  end
end
