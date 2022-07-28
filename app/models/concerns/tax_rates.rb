module TaxRates
  extend ActiveSupport::Concern

  def get_tax_rate(vehicle)
    return 0 if vehicle.stock_type_used?

    tax = 55

    if vehicle.commercial?
      tax += vehicle.carbon_based? ? 290 : 0
    else
      case vehicle.co2
      when 0
        return tax
      when 1..50
        tax += vehicle.carbon_based? ? 10 : 0
      when 51..75
        tax += vehicle.carbon_based? ? 25 : 15
      when 76..90
        tax += vehicle.carbon_based? ? 120 : 110
      when 91..100
        tax += vehicle.carbon_based? ? 150 : 140
      when 101..110
        tax += vehicle.carbon_based? ? 170 : 160
      when 111..130
        tax += vehicle.carbon_based? ? 190 : 180
      when 131..150
        tax += vehicle.carbon_based? ? 230 : 220
      when 151..170
        tax += vehicle.carbon_based? ? 585 : 575
      when 171..190
        tax += vehicle.carbon_based? ? 945 : 935
      when 191..225
        tax += vehicle.carbon_based? ? 1420 : 1410
      when 226..255
        tax += vehicle.carbon_based? ? 2015 : 2005
      else
        tax += vehicle.carbon_based? ? 2365 : 2355
      end
    end

    tax
  end
end
