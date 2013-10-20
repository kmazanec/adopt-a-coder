# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :response do |f|
    f.question_id "1"
    f.application_id "2"
    f.body "happiness is the key to life"
  end
end
