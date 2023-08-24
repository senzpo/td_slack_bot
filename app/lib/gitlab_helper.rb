# frozen_string_literal: true

class GitlabHelper
  class << self
    def get_merge_requests(page: 1, per_page: 100, result: [])
      page_result = Gitlab.merge_requests(project.id, { page: page, per_page: per_page })

      return result if page_result.blank?

      updated_result = result.concat(page_result)
      get_merge_requests(page: page + 1, per_page: per_page, result: updated_result)
    end

    def project
      @project ||= Gitlab.project(ENV['GITLAB_TECH_DESIGN_ID'])
    end
  end
end
