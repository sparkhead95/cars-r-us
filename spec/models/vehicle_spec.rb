# == Schema Information
#
# Table name: vehicles
#
#  id                 :integer          not null, primary key
#  co2                :integer
#  commercial_vehicle :boolean
#  fuel_type          :string
#  stock_type         :string
#  vehicle_tax        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it 'works' do
    vehicle = Vehicle.new(stock_type: :new, fuel_type: :electric)
    expect(vehicle.stock_type_new?).to be true
  end
end
