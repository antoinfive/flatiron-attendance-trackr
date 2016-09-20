require 'rails_helper'

RSpec.describe Schedule, :type => :model do
  before(:all) do 
    FactoryGirl.create(:cohort)
    @schedule = Schedule.first
  end

  it 'has many days, as an array of dates' do 
    expect(@schedule.days.count).to eq(91)
  end

  it 'knows which days are weekdays' do 
    expect(@schedule.weekdays_that_arent_holidays.count).to eq(65)
  end

  it 'has an attendance record for each student on each day of the schedule' do 
    expect(@schedule.attendance_records.count).to eq(650)
  end

  it 'belongs to a cohort' do
    expect(@schedule.cohort).to eq(Cohort.first)
  end
end
