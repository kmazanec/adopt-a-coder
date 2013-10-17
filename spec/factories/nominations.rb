# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nomination do |f|
    f.campaign_id "2"
    f.donor_id "1"
    f.candidate_id "2"
  end
end
