# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media do |f|
    f.url "www.google./adoptme"
    f.type "video"
    f.user_id "2"
  end
end

