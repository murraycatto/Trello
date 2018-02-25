class AddAcitivtyTypeToCardActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :card_activities, :activity_type, :integer
  end
end
