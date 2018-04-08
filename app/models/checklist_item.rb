class ChecklistItem < ApplicationRecord
  enum status: {complete:1,incomplete:0}
  belongs_to :checklist

end
