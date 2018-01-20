class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.boolean :personal
      t.boolean :private

      t.timestamps
    end
  end
end
