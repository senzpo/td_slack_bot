# frozen_string_literal: true

class BitbucketHelper
  class << self
    def pull_requests
      repo = Tinybucket.new.repo('taxesforexpats', 'taxdome')
      repo.pull_requests
    end
  end
end
