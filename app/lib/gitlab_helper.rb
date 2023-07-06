# frozen_string_literal: true

class GitlabHelper
  class << self
    def get_merge_requests(page: 1, per_page: 100)
      Gitlab.merge_requests(project.id, { page:, per_page: })
    end

    def project
      @project ||= Gitlab.project(33_352_195)
    end
  end
end
