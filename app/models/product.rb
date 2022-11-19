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

  validates :image, presence: { message: "を選択してください" }
  validates :name, presence: true
  validates :description, presence: true
  validates :user, presence: true

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

end
