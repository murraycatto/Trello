module BoardsHelper
  def add_labels
    5.times do |i|
      labels.create(color: Color.find(i + 1))
    end
  end
end
