class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :stock_type
      t.string :fuel_type
      t.integer :co2
      t.boolean :commercial_vehicle
      t.integer :vehicle_tax

      t.timestamps
    end
  end
end
