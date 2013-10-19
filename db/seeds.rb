donor_ids = []
candidate_ids = []

d = Donor.create(name: "Daddy Warbucks", email: "dad@warbucks.com", password: "test", password_confirmation: "test")
donor_ids << d.id
d = Donor.create(name: "Eric Schultz", email: "eric@google.com", password: "test", password_confirmation: "test")
donor_ids << d.id
d = Donor.create(name: "Darlene McCormick", email: "darlene@cars.com", password: "test", password_confirmation: "test")
donor_ids << d.id
d = Donor.create(name: "Wilma Rogers", email: "wilma@gmail.com", password: "test", password_confirmation: "test")
donor_ids << d.id
d = Donor.create(email: "rich@rich.biz", password: "test", password_confirmation: "test")
donor_ids << d.id

c = Candidate.create(name: "Kevin Another", email: "kevin@another.com", phone: "123-456-7890",
                password: "test", password_confirmation: "test", address1: "123 State St",
                city: "Chicago", state: "IL", zip: "60600", twitter: "@kevinAnother22",
                facebook: "facebook.com/kevinanother22", blog: "kevinanother.tumblr.com")
candidate_ids << c.id

m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)



c = Candidate.create(name: "Tiffany Another", email: "tiffany@another.com", phone: "456-789-1023",
                password: "test", password_confirmation: "test", address1: "456 Sesame Way",
                city: "Boise", state: "ID", zip: "78012")

candidate_ids << c.id
m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)

c = Candidate.create(name: "Kenan Thompson", email: "kenan@thompson.com", phone: "634-345-7253",
                password: "test", password_confirmation: "test", address1: "29801 Fort Thomas Pike",
                address2: "Apt. 3D", city: "Nashville", state: "TN", zip: "37211")

candidate_ids << c.id
m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)

c = Candidate.create(name: "Maria Lopez", email: "maria@lopez.com", phone: "928-356-1535",
                password: "test", password_confirmation: "test", address1: "87 West North Ave",
                city: "Gainesville", state: "FL", zip: "34535")

candidate_ids << c.id
m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)


Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12000)

15.times do
  str = ""
  10.times { str << rand(97..122).chr }
  Donation.create(token: str, amount: rand(10..500), donor_id: donor_ids.sample, campaign_id: 1)
end

Donor.all.each do |donor|
  donor.nominations.build(campaign_id: 1, candidate_id: candidate_ids.sample)
  donor.save
end

Candidate.all.each {|c| c.profile_video_id = 2; c.save }
Candidate.all.each {|c| c.profile_photo_id = 1; c.save }
