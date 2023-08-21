# frozen_string_literal: true

module Web
  class TaxdomeMembersController < ApplicationController
    def index
      @taxdome_members = Slack::TaxdomeMember.all
    end
  end
end
