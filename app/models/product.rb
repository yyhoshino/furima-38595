class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_day

  has_one_attached :image
  belongs_to :user
  has_one :purchase

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user, presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_day_id
    validates :prefecture_id
  end

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :image, presence: { message: "Image can't be blank" }
end
