# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Web::TaxdomeMembersController', type: :request do
  let(:taxdome_member) do
    Slack::TaxdomeMember.create!(external_id: 'external_id', real_name: 'real_name', email: 'some@example.com', role:,
                                 is_deleted: false)
  end
  let(:new_real_name) { 'New name' }
  let(:role) { 'Some role' }

  describe 'GET /taxdome_members' do
    it 'respond with success' do
      get taxdome_members_url
      expect(response).to be_successful
    end
  end

  describe 'GET /taxdome_members/:id/edit' do
    it 'respond with success' do
      get edit_taxdome_member_url(taxdome_member.id)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /taxdome_members/:id' do
    it 'respond with success' do
      patch taxdome_member_url(taxdome_member.id), params: {
        slack_taxdome_member: {
          real_name: new_real_name,
          role: 'ADMIN'
        }
      }
      taxdome_member.reload

      expect(response).to be_redirect
      expect(taxdome_member.real_name).to eq(new_real_name)
      expect(taxdome_member.role).to eq(role)
    end
  end
end
