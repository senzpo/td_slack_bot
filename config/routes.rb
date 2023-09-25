# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index'
    resources :gitlab_merge_requests, only: %i[index show]
    resources :gitlab_merge_request_events, only: %i[index]
    resources :bitbucket_pull_requests, only: %i[index]
    resources :taxdome_members, only: %i[index edit update]
    resource :service_team, only: %i[show]
    get 'logins', to: 'logins#index'
    get 'logins/create', to: 'logins#create', as: :create_login
  end
end
