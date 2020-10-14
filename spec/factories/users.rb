FactoryBot.define do
  factory :user do
    nickname                         {Faker::Name.initials(number: 2)}
    email                            {Faker::Internet.free_email}
    password                         {Faker::Internet.password(min_length: 6)}
    password_confirmation            {password}
    first_name                       {Gimei.last}
    last_name                        {Gimei.first}
    first_name_kana                  {Gimei.last.katakana}
    last_name_kana                   {Gimei.first.katakana}
    birthday                         {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end