# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Web::Welcomes', type: :request do
  describe 'GET /index' do
    it 'respond with success' do
      get root_url
      expect(response).to be_successful
    end
  end
end
