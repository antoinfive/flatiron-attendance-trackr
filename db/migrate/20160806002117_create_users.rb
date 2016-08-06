class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :github_username
      t.string :email
      t.references :cohort, null: true
      t.boolean :instructor, :default => false

      t.timestamps
    end
  end
end
