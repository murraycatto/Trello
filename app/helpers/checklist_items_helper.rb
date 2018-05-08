# Checklist Item helper
module ChecklistItemsHelper
  def toggel_status
    if complete?
      incomplete!
    else
      complete!
    end
  end
end
