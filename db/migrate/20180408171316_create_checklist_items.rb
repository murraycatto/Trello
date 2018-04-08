class CreateChecklistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :checklist_items do |t|
      t.string :name
      t.integer :status, default: 0
      t.references :checklist, foreign_key: true

      t.timestamps
    end
  end
end
