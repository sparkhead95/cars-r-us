class Vehicle < ApplicationRecord
  enum stock_type: { new: 'new', used: 'used'}, _prefix: true
  enum fuel_type: { electric: 'electric', hybrid: 'hybrid', pertrol: 'petrol', diesel: 'diesel'}

  validates :stock_type, presence: true

  # ...
  # 100s of lines of code deleted, as they are not relevant to this task
  # but if they were included this would be a big model
  # ...

end
