FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end

  factory :harbor do
    name 'Belfast'
    state 'ME'
    description 'this is a description'
  end

  factory :mooring do
    latitude 44.424536
    longitude -68.989595
    price 50
    state 'ME'

    user
    harbor
  end
end
