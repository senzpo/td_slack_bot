# frozen_string_literal: true

class BitbucketHelper
  class << self
    def pull_requests(update_date)
      repo = Tinybucket.new.repo('taxesforexpats', 'taxdome')
      repo.pull_requests(state: 'All', q: "updated_on > #{update_date}")
    end
  end
end
