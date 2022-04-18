FactoryBot.define do
  factory :purchase_record_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street_number { '1-1' }
    building { '東京ハイツ' }
    phone_number { '1111111111' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end