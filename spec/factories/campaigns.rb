# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do |f|
    f.candidate_id "3"
    f.start_date "10-11-1111"
    f.end_date "09-12-1111"
    f.total "12099"
    f.goal "1111"

  end
end
