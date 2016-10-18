class User < ApplicationRecord
  belongs_to :cohort
  has_many :attendance_records

  def self.find_or_create_from_oauth(auth_hash)   
    User.find_or_create_by(uid: auth_hash["id"]) do |user|
      user.first_name = auth_hash["first_name"]
      user.last_name = auth_hash["last_name"]
      user.email = auth_hash["email"]
      user.uid = auth_hash["id"]
      user.instructor = auth_hash["admin"]
      user.cohort_id = 1
      user.save
    end
  end
end

