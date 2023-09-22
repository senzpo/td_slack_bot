# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::WelcomeController, type: :controller do
  let(:user_id) { 'Some GUID' }

  describe 'GET /index' do
    before do
      session[:user_id] = user_id
    end

    it 'respond with success' do
      get :index
      expect(response).to be_successful
    end
  end
end
