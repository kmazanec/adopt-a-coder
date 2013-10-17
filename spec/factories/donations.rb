# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :donation do |f|
    f.token "02348210485724"
    f.amount "10"
    f.donor_id "3"
    f.campaign_id "2"

  end
end

