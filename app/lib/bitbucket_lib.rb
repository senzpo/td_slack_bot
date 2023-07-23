# frozen_string_literal: true

class BitbucketLib
  @bucket = Tinybucket.new
  @repo = @bucket.repo('taxesforexpats', 'taxdome')

  class << self
    def pull_requests
      @repo.pull_requests.select { |pr| pr.created_on > 3.months.ago }
    end
  end
end
