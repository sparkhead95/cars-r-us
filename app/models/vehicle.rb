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
class Vehicle < ApplicationRecord
  include TaxRates

  enum stock_type: { new: 'new', used: 'used'}, _prefix: true
  enum fuel_type: { electric: 'electric', hybrid: 'hybrid', petrol: 'petrol', diesel: 'diesel'}

  validates :stock_type, presence: true
  validates :commercial_vehicle, inclusion: { in: [ true, false ] }
  validates :co2, presence: true
  validates :fuel_type, presence: true

  before_save :calculate_tax

  def carbon_based?
    petrol? || diesel?
  end

  def commercial?
    commercial_vehicle
  end

  # I normally have the permitted params in the controller, but as I'm not writing
  # the view/controllers myself, I'll put the params in here for ease of use for the
  # dev that's doing the VC work.
  def self.permitted_params
    [:co2, :commercial_vehicle, :fuel_type, :stock_type, :vehicle_tax]
  end

  private

  def calculate_tax
    self.vehicle_tax = get_tax_rate(self)
  end

  # ...
  # 100s of lines of code deleted, as they are not relevant to this task
  # but if they were included this would be a big model
  # ...

end
