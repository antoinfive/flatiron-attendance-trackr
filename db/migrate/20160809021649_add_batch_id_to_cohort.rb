class AddBatchIdToCohort < ActiveRecord::Migration[5.0]
  def change
    add_column :cohorts, :batch_id, :string
  end
end
