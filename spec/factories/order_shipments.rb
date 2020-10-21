FactoryBot.define do
  factory :order_shipment do
    token                          {"tok_abcdefghijk00000000000000000"}
    post_code                      { '123-4567' }
    prefecture_id                  { Faker::Number.between(from: 2, to: 48) }
    city_town                      { '千代田区' }
    address                        { '千代田1-1' }
    building_name                  { 'ABCマンション101' }
    phone_number                   { Faker::Number.leading_zero_number(digits: 11) }
  end
end
