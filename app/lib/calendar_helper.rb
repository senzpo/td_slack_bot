# frozen_string_literal: true

class CalendarHelper
  class << self
    delegate :business_days_between, to: :calendar

    delegate :business_day?, to: :calendar

    delegate :working_day?, to: :calendar

    def calendar
      Business::Calendar.new
    end
  end
end
