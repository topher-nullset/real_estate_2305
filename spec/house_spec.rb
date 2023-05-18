require './lib/room'
require './lib/house'

RSpec.describe House do

  describe "Iteration 2" do

    before :each do
      @house = House.new("$400000", "123 sugar lane")
    end

    it "exists" do
      expect(@house).to be_a House
    end

    it "has a price" do
      expect(@house.price).to eq("$400000")
    end

    it "has an address" do
      expect(@house.address).to eq("123 sugar lane")
    end

    it "can be given rooms" do
      expect(@house.rooms).to eq([])
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      @house.add_room(room_1)
      @house.add_room(room_2)
      expect(@house.rooms).to eq([room_1, room_2])
    end
  end

  describe "Iteration 3" do

    before :each do
      @house = House.new("$400000", "123 sugar lane")
      @room_1 = Room.new(:bedroom, 10, '13')
      @room_2 = Room.new(:bedroom, 11, '15')
      @room_3 = Room.new(:living_room, 25, '15')
      @room_4 = Room.new(:basement, 30, '41')
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
    end

    it "can be above or below marker" do
      expect(@house.above_market_average?).to eq(false)
    end

    it "can selest rooms by category" do
      expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
      expect(@house.rooms_from_category(:basement)).to eq([@room_4])
    end

    it "has a total area" do
      expect(@house.area).to eq(1900)
    end
  end
end