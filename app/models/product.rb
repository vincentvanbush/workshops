class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: true, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
  	avg = 0.0
  	reviews.each { |r| avg += r.rating }
  	avg /= reviews.count
  end
end
