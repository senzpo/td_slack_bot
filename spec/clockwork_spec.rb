# frozen_string_literal: true

require 'rails_helper'
require 'clockwork/test'

RSpec.describe Clockwork do
  after { Clockwork::Test.clear! }

  let(:clock_file) { Rails.root.join('clock.rb') }

  it 'runs refresh jobs' do
    Clockwork::Test.run(max_ticks: 1, file: clock_file)

    expect(Clockwork::Test.times_run('Refresh TD members')).to eq 1
    expect(Clockwork::Test.times_run('Refresh GitlabMergeRequests')).to eq 1
    expect(Clockwork::Test.times_run('Refresh BitbucketPullRequests')).to eq 1
  end

  it 'runs Publish service team health on working days' do
    start_time = Time.utc(2023, 11, 6, 0, 0, 0)
    end_time = Time.utc(2023, 11, 13, 0, 0, 0)
    Clockwork::Test.run(start_time:, end_time:, tick_speed: 1.minute, file: clock_file)

    expect(Clockwork::Test.times_run('Publish service team health')).to eq 5
  end

  it 'runs Publish outdated Technical once a week' do
    start_time = Time.utc(2023, 11, 7, 0, 0, 0)
    end_time = Time.utc(2023, 11, 7, 23, 0, 0)
    Clockwork::Test.run(start_time:, end_time:, tick_speed: 1.minute, file: clock_file)

    expect(Clockwork::Test.times_run('Publish outdated Technical design')).to eq 1
  end

  it "runs Publish outdated Technical design on Tuesday's" do
    start_time = Time.utc(2023, 11, 6, 0, 0, 0)
    end_time = Time.utc(2023, 11, 12, 23, 0, 0)
    Clockwork::Test.run(start_time:, end_time:, tick_speed: 1.minute, file: clock_file)

    expect(Clockwork::Test.times_run('Publish outdated Technical design')).to eq 1
  end
end
