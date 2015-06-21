class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates_presence_of :title, :description, :price
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def average_rating
  	self.reviews.average(:rating).try(:round, 2)
  end
end
