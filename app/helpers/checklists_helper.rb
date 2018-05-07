# Checklist helper
module ChecklistsHelper
  def complete_percentage
    complete = checklist_items.complete.count
    count = checklist_items.count
    percentage = (complete.to_f / count.to_f) * 100
    percentage = 0 if count.zero?
    percentage.to_i
  end

  def complete?
    checklist_items.count == checklist_items.complete.count
  end

  def complete_status
    if complete?
      'complete'
    else
      'incomplete'
    end
  end
end
