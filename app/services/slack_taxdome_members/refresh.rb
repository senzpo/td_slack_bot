# frozen_string_literal: true

module SlackTaxdomeMembers
  class Refresh
    def self.perform
      SlackHelper.taxdome_members.each do |td_member|
        params = {
          external_id: td_member[:id],
          is_deleted: td_member[:deleted],
          real_name: td_member[:profile][:real_name],
          role: td_member[:profile][:title],
          email: td_member[:profile][:email],
          avatar_link: td_member[:profile][:image_original] || td_member[:profile][:image_192]
        }

        taxdome_member = Slack::TaxdomeMember.find_or_initialize_by(external_id: td_member[:id])
        taxdome_member.update!(params)
      end
    end
  end
end
