class Product < ActiveRecord::Base

  has_many :reviews
  belongs_to :user
  belongs_to :category

  validates :description, :name, presence: true
  validates :price_in_cents, numericality: { only_integer: true }
  before_save :capitalize_name

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%0.2f", price_in_dollars)
  end

  private

  def capitalize_name
    self.name = self.name.capitalize
  end
end
