require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:all) do 
    @cohort = FactoryGirl.create(:cohort)
    @student = @cohort.students.first
  end
  context "as a student" do 
    it 'belongs to a cohort' do
      expect(@student.cohort).to eq(@cohort) 
    end
  end
end
