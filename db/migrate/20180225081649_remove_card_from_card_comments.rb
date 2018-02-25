class RemoveCardFromCardComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :card_comments, :card_id
    add_reference :card_comments, :card_activity, foreign_key: true
  end
end
