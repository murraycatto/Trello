class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :user_id
      t.integer :color_id
      t.integer :team_id

      t.timestamps
    end
  end
end
