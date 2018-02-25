class CreateCardActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :card_activities do |t|
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
