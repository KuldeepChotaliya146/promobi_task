FactoryBot.define do
  factory :tutor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    association :course
  end
end