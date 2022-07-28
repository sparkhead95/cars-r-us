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
  it 'has tax if it is a new vehicle' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :electric, co2: 10, commercial_vehicle: false)
    expect(vehicle.vehicle_tax).to_not be 0
  end

  it 'has no tax if it is a used vehicle' do
    vehicle = Vehicle.create(stock_type: :used, fuel_type: :electric, co2: 10, commercial_vehicle: false)
    expect(vehicle.vehicle_tax).to be 0
  end

  it 'has only £55 tax if new with 0 co2' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :petrol, co2: 0, commercial_vehicle: false)
    expect(vehicle.vehicle_tax).to be 55
  end

  it 'is invalid with nil attributes' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :electric)
    expect(vehicle).to_not be_valid
  end

  it 'has 55 tax if it is commercial electric car' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :electric, co2: 0, commercial_vehicle: true)
    expect(vehicle.vehicle_tax).to be 55
  end

  it 'has £245 tax if it is petrol non-commercial car with 120 co2' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :petrol, co2: 120, commercial_vehicle: false)
    expect(vehicle.vehicle_tax).to be 245
  end

  it 'has £75 tax if it is diesel non-commercial car with 60 co2' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :diesel, co2: 60, commercial_vehicle: false)
    expect(vehicle.vehicle_tax).to be 80
  end

  it 'has £275 tax if it is a hybrid non-commercial car with 140 co2' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :hybrid, co2: 140, commercial_vehicle: false)
    expect(vehicle.vehicle_tax).to be 275
  end

  it 'has £2060 tax if it is an electric non-commercial car with 240 co2' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :electric, co2: 240, commercial_vehicle: false)
    expect(vehicle.vehicle_tax).to be 2060
  end

  it 'has £345 tax if it is a petrol commercial car with 240 co2' do
    vehicle = Vehicle.create(stock_type: :new, fuel_type: :petrol, co2: 240, commercial_vehicle: true)
    expect(vehicle.vehicle_tax).to be 345
  end
end
