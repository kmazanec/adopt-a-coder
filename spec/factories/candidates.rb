# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :candidate do |f|
      f.email "k2@gmail.com"
      f.name "Kevin second"
      f.phone "555-212-6541"
      f.password "Password1"
      f.password_confirmation "Password1"
      f.address1 "22 north illinois"
      f.address2 "apt 6002"
      f.city "Chicago"
      f.state "IL"
      f.zip "06061"
      f.twitter "kevin@twitter.com"
      f.facebook "kevin@facebook.com"
      f.linked_in "kevin@linked in"
      f.codeacademy "badges"
      f.github "kevin@github.com"
      f.blog "tumblerkevin@tumblr.com"
      f.personal_url "kevin@tumblr.com"
      f.currently_working_on "codes  academy"
      f.biography "from the north side yo"
      f.mission "become a great coder too"
      f.profile_photo_id "2"
      f.profile_video_id "2"
      f.type "Candidate"
  end
end


