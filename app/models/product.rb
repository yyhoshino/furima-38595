class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_day

  has_one_attached :image
  belongs_to :user

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :user, presence: true

  with_options numericality: { other_than: 1 , message: "can't be blank"}do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_day_id
    validates :prefecture_id
  end

end
