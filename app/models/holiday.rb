class Holiday < ApplicationRecord
  validates :date, presence: true, uniqueness: true

  DEFAULT_HOLIADYS = []

  def self.set_holidays_to_default

  end
end
