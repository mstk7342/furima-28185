FactoryBot.define do
  factory :item do
    name              { 'さんぷる' }
    description       { 'さんぷる' }
    category_id       { 2 }
    status_id         { 2 }
    shopping_cost_id  { 2 }
    shopping_days_id  { 2 }
    prefectures_id    { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end

# Active_hashで記述したものには「id」をつける
