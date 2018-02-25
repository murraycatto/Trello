class CreateCardActivityItems < ActiveRecord::Migration[5.1]
  def change
    create_table :card_activity_items do |t|
      t.references :card_activity, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
