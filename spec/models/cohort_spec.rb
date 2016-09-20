require 'rails_helper'

RSpec.describe Cohort, :type => :model do
  let!(:cohort) {FactoryGirl.create(:cohort)}
  it 'has many students' do 
    expect(cohort.students.length).to eq(10)
  end

  it 'has one schedule' do 
    expect(cohort.schedule).to eq(Schedule.first)
  end
end
