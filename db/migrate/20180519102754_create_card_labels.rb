class CreateCardLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :card_labels do |t|
      t.references :label, foreign_key: true
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
