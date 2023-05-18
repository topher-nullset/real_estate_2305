class House

  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price.gsub('$', '').to_i > 500_000
  end

  def rooms_from_category(category)
    @rooms.select { |room| room.category == category }
  end

  def area
    @rooms.sum(&:area)
  end

end