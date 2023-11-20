# frozen_string_literal: true

module GitlabMergeRequests
  class CalculateStats
    def self.perform
      # TODO: use join)
      events = Gitlab::MergeRequestEvent.merged.join(:merge_request)
      requests = events.map(&:merge_request)
      stats = []
      # debug = []
      requests.each do |request|
        opened_at = request.merge_request_events.opened.first&.produced_at
        merged_at = request.merge_request_events.merged.first&.produced_at
        next if opened_at.blank? || merged_at.blank?

        # debug << "opened at #{opened_at} merged at#{merged_at}"
        stats << merged_at - opened_at
      end
      # ["merged", "opened", "closed"]

      stats.sum / stats.count

      # irb(main):080:0> stats.sum / stats.count / (60*60*24)
      # => 11.165928021397923
      # median - 8
      # Last 41 designs
    end
  end
end
