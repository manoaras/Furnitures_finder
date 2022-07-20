class Furniture < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :price_per_day, presence: true
  validates :genre, presence: true

  has_many_attached :photos

  geocoded_by :city

  after_validation :geocode, if: :will_save_change_to_city?
end
