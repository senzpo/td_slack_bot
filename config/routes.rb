# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index'
    resources :gitlab_merge_requests, only: %i[index]
    resources :gitlab_merge_request_events, only: %i[index]
    resources :bitbucket_pull_requests, only: %i[index]
    resources :taxdome_members, only: %i[index]
  end

  namespace 'api', api_scope: true, defaults: { format: :json } do
    resources :gitlab_merge_requests, only: %i[index] do
      collection do
        get :refresh
      end
    end
    resources :bitbucket_pull_requests, only: %i[index] do
      collection do
        get :refresh
      end
    end
    resources :taxdome_members, only: %i[index] do
      collection do
        get :refresh
      end
    end
  end
end
