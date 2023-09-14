# frozen_string_literal: true

module Web
  class TaxdomeMembersController < ApplicationController
    def index
      @taxdome_members = Slack::TaxdomeMember.all
    end

    def edit
      @taxdome_member = Slack::TaxdomeMember.find(params[:id])
    end

    def update
      @taxdome_member = Slack::TaxdomeMember.find(params[:id])
      @taxdome_member.assign_attributes(member_params)

      if @taxdome_member.save
        redirect_to taxdome_members_url
      else
        render :edit
      end
    end

    private

    def member_params
      params.require(:slack_taxdome_member).permit(:real_name)
    end
  end
end
