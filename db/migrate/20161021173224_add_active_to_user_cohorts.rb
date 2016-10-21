class AddActiveToUserCohorts < ActiveRecord::Migration[5.0]
  def change
    add_column :user_cohorts, :active, :boolean, default: false
  end
end
