class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :statu
  belongs_to :prefecture
  belongs_to :shopping_cost
  belongs_to :shopping_day

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :prefectures_id
    validates :shopping_cost_id
    validates :shopping_days_id
  end

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

end
