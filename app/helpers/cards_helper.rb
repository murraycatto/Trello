module CardsHelper
  def new_list?(new_list_id)
    old_list = self.list
    old_list.id.to_s != new_list_id.to_s
  end
end
