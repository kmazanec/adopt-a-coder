# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do |f|
      f.email "ka@gmail.com"
      f.name "Kevin Another"
      f.phone "555-212-6061"
      f.password_digest "Password"
      f.address1 "225 north illinois"
      f.address2 "apt 60602"
      f.city "Chicago"
      f.state "IL"
      f.zip "06061"
      f.twitter "scott@twitter.com"
      f.facebook "scott@facebook.com"
      f.linked_in "scott@linked in"
      f.codeacademy "badges"
      f.github "scott@github.com"
      f.blog "tumblerme@tumblr.com"
      f.personal_url "scott@tumblr.com"
      f.currently_working_on "code academy"
      f.biography "from the north side"
      f.mission "become a great coder"
      f.profile_photo_id "1"
      f.profile_video_id "1"
      f.type "Donor"
  end
end
