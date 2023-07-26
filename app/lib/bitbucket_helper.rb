# frozen_string_literal: true

class BitbucketHelper
  @bucket = Tinybucket.new
  @repo = @bucket.repo('taxesforexpats', 'taxdome')

  class << self
    def pull_requests
      @repo.pull_requests
    end
  end
end
