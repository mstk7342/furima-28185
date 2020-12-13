class BuyerDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addres, :building_name, :phone_number, :buyer_id, :user_id, :item_id, :token
  

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}[-][0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :addres
    validates :phone_number, length: { minimum: 10, maximum:11, message: "Phone_number is too long (maximum is 11 characters)" }
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end

  def save
    buyer = Buyer.create( user_id: user_id, item_id: item_id)
    # binding.pry
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addres: addres, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
    
end