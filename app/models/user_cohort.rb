class UserCohort < ApplicationRecord
  belongs_to :instructor, class_name: 'User', foreign_key: 'instructor_id'
  belongs_to :cohort
  before_save :check_active

  def check_active
    previous_active_cohort = UserCohort.find_by(instructor_id: self.id, active: true)
    if previous_active_cohort && previous_active_cohort.cohort_id != self.cohort_id
      previous_active_cohort.update(active: false)
    end
  end
end
