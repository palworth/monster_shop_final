class Item < ApplicationRecord
  belongs_to :merchant
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews, dependent: :destroy

  validates_presence_of :name,
                        :description,
                        :image,
                        :price,
                        :inventory

  def self.active_items
    where(active: true)
  end

  def self.by_popularity(limit = nil, order = "DESC")
    left_joins(:order_items)
    .select('items.id, items.name, COALESCE(sum(order_items.quantity), 0) AS total_sold')
    .group(:id)
    .order("total_sold #{order}")
    .limit(limit)
  end

  def sorted_reviews(limit = nil, order = :asc)
    reviews.order(rating: order).limit(limit)
  end

  def average_rating
    reviews.average(:rating)
  end

  def unit_price(quantity)
    if merchant.discounts.select(:percent_off).where("lowest_amount < #{quantity} AND highest_amount > #{quantity}").order("percent_off").limit(1).pluck(:percent_off).first.nil?
      price
    else
        price * (1 - 0.01*merchant.discounts.select(:percent_off).where("lowest_amount < #{quantity} AND highest_amount > #{quantity}").order("percent_off").limit(1).pluck(:percent_off).first)
    end
  end
end
