class Tax < ApplicationRecord

  ES = 'ES'
  COUNTRIES = [ES]

  validates :country, presence: true
  validates :vat_rate, presence: true

end
