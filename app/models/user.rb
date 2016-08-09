class User < ApplicationRecord
  belongs_to :cohort
  has_many :attendance_records

  def self.find_or_create_from_oauth(auth_hash)
    binding.pry
    User.find_or_create_by(uid: auth_hash["uid"]) do |user|
      user.first_name = auth_hash["info"]["first_name"]
      user.last_name = auth_hash["info"]["last_name"]
      user.email = auth_hash["info"]["email"]
      user.oauth_token = auth_hash["info"]["token"]
      user.save
    end
  end
end
