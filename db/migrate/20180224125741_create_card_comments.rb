class CreateCardComments < ActiveRecord::Migration[5.1]
  def change
    create_table :card_comments do |t|
      t.text :comment
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
