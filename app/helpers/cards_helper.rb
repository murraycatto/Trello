module CardsHelper
  def new_list?(new_list_id)
    old_list = list
    old_list.id.to_s != new_list_id.to_s
  end

  def add_card_activity(content, user)
    card_activity = card_activities.new
    card_activity.build_card_activity_item(
      content: content,
      user: user
    )
    card_activity.save!
  end
end
