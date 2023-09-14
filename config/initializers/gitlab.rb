# frozen_string_literal: true

Gitlab.endpoint = ENV.fetch('GITLAB_ENDPOINT', nil)
Gitlab.private_token = ENV.fetch('GITLAB_OAUTH_TOKEN', nil)
