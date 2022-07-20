require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it 'works' do
    vehicle = Vehicle.new(stock_type: :new, fuel_type: :electric)
    expect(vehicle.stock_type_new?).to be true
  end
end
