# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'welcome#index'
  end

  namespace 'api', api_scope: true, defaults: { format: :json } do
    resources :gitlab_merge_requests, only: %i[index] do
      collection do
        get :refresh
      end
    end
  end
end
