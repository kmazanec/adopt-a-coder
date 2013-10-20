# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :application do |f|
    f.candidate_id "2"
    f.complete false

  end
end
