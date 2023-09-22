# frozen_string_literal: true

module ApplicationHelper
  def gitlab_mr_url(id)
    "https://gitlab.taxdome.dev/taxdome/docs/tech-design/-/merge_requests/#{id}"
  end

  def gitlab_mr_table_highlight(merge_request)
    if merge_request.outdated?
      'table-danger'
    elsif merge_request.draft?
      'table-secondary'
    elsif merge_request.closed?
      'table-dark'
    elsif merge_request.merged?
      'table-success'
    end
  end
end
