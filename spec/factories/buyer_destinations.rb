FactoryBot.define do
  factory :buyer_destination do
    postal_code      {'123-4567'}
    prefecture_id   { 2 }
    city             {'港区'}
    addres           {'青山1-1-1'}
    building_name    {''}
    phone_number     {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    item_id          { 1 }
    user_id          { 1 }
  end
end
