FactoryGirl.define do
  factory :payment do
    date { Faker::Date.backward(14) }
    amount 100
    student nil
  end

end
