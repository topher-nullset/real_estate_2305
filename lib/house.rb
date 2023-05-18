class House

  attr_reader :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price_to_int
    @price.gsub('$', '').to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price_to_int > 500_000
  end

  def rooms_from_category(category)
    @rooms.select { |room| room.category == category }
  end

  def area
    @rooms.sum(&:area)
  end

  def details
    {"price" => price_to_int, "address" => address}
  end

  def price_per_square_foot
    (price_to_int.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by { |room| room.area }.reverse
  end

  def rooms_by_category
    categories = @rooms.map(&:category).uniq
    categories.each_with_object({}) { |category, hash| hash[category] = rooms_from_category(category) }
  end
end