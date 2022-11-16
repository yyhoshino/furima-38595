class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase, :user_id, :product_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end

    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

    def save
      purchase = Purchase.create(user_id: user_id, product_id: product_id)

      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,
                     phone_number: phone_number, purchase_id: purchase.id)
    end
end