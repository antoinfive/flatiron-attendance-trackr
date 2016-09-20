FactoryGirl.define do
  factory :cohort do 
    name "web-0718"

    after(:create) do |cohort|
      10.times do 
        create(:user, cohort_id: cohort.id)
      end
      create(:schedule, cohort_id: cohort.id)
    end
  end
end