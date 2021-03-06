class CreateLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :labels do |t|
      t.string :name
      t.references :board, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
