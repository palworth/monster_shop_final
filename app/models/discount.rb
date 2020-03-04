class Discount < ApplicationRecord
  belongs_to :merchant
  validates_presence_of :title,
                        :percent_off,
                        :information,
                        :lowest_amount,
                        :highest_amount

  def discount_range
    "#{lowest_amount + 1} - #{highest_amount - 1} items"
  end
end
