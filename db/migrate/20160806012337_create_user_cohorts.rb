class CreateUserCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cohorts do |t|       
      t.integer :instructor_id
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
