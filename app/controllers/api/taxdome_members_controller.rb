# frozen_string_literal: true

module Api
  class TaxdomeMembersController < ApplicationController
    def index
      taxdome_members = Slack::TaxdomeMember.all
      render json: taxdome_members.to_json
    end

    def refresh
      Slack::TaxdomeMembers::Refresh.perform
      render json: { success: true }
    end
  end
end
