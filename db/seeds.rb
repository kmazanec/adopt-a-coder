require 'faker'

# Image.create(url: "thinker.jpg")

donor_ids = []
candidate_ids = []

life_questions = ["Briefly introduce yourself with any information you think is important",
                  "Tell us about an experience from your life that has influenced your development as a person.",
                  "Describe your most meaningful achievement that has made an impact in your community",
                  "How would you utilize your experience from this program to give back to your community?"]

tech_questions = ["What is it about technology or coding that excites you?",
                  "Tell us your understanding of how the internet works in 200 words or less.",
                  "Tell us how you will use the internet to change the world?"]

need_questions = ["How will you stay motivated for 9 weeks in an intensive learning environment?",
                  "How will an experience like this improve your life for the better?",
                  "Please briefly describe what qualifies you for this scholarship",
                  "How can this website be improved to be more accessible for potential candidates like yourself?"]

life_questions.each do |question|
  Question.create(body: question)
end

tech_questions.each do |question|
  Question.create(body: question)
end

need_questions.each do |question|
  Question.create(body: question)
end

5.times do
d = Donor.create(name: Faker::Name.name, email: Faker::Internet.free_email, password: "test", password_confirmation: "test")
donor_ids << d.id
end

c = Candidate.create(name: "Lindsay James", email: "lindsay_james@hotmail.com", phone: "123-456-7890",
                password: "test", password_confirmation: "test", address1: "123 State St",
                city: "Chicago", state: "IL", zip: "60600", twitter: "http://www.twitter.com/kevinAnother22",
                facebook: "https://facebook.com/kevinanother22", blog: "http://kevinanother.tumblr.com",
                mission: "Becoming a software engineer has been my lifelong dream.  I want to create the technology that powers people's lives.  This scholarship will allow me to pursue my dreams while supporting my family.",
                biography: Faker::Lorem.paragraph(15))
candidate_ids << c.id


m = Media.create(url: "Adigo_small.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

f = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: f.id)



# c = Candidate.create(name: "Tiffany Another", email: "tiffany@another.com", phone: "456-789-1023",
#                 password: "test", password_confirmation: "test", address1: "456 Sesame Way",
#                 city: "Boise", state: "ID", zip: "78012", facebook: "https://www.facebook.com/oprahwinfrey",
#                 twitter: "https://twitter.com/Oprah", linked_in: "http://www.linkedin.com/pub/lebron-james/37/901/43a?trk=pub-pbmap",
#                 codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
#                 blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
#                 personal_url: "http://www.dolekemp96.org/main.htm", mission: "Go to DBC!",
#                 biography: "Akwardly talk about myself")

# candidate_ids << c.id
# m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
#              type: "Image", user_id: c.id)
# c.update_attributes(profile_photo_id: m.id)

# m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
#              type: "Video", user_id: c.id)
# c.update_attributes(profile_video_id: m.id)

# c = Candidate.create(name: "Kenan Thompson", email: "kenan@thompson.com", phone: "634-345-7253",
#                 password: "test", password_confirmation: "test", address1: "29801 Fort Thomas Pike",
#                 address2: "Apt. 3D", city: "Nashville", state: "TN", zip: "37211", facebook: "https://www.facebook.com/oprahwinfrey",
#                 twitter: "https://twitter.com/Oprah", linked_in: "http://www.linkedin.com/pub/lebron-james/37/901/43a?trk=pub-pbmap",
#                 codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
#                 blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
#                 personal_url: "http://www.dolekemp96.org/main.htm", mission: "Go to DBC!",
#                 biography: "Akwardly talk about myself")

# candidate_ids << c.id
# m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
#              type: "Image", user_id: c.id)
# c.update_attributes(profile_photo_id: m.id)

# m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
#              type: "Video", user_id: c.id)
# c.update_attributes(profile_video_id: m.id)

c = Candidate.create(name: "Maria Lopez", email: "maria@lopez.com", phone: "928-356-1535",
                password: "test", password_confirmation: "test", address1: "87 West Highland Ave",
                city: "Sandusky", state: "OH", zip: "34535", facebook: "https://www.facebook.com/marialopez",
                twitter: "https://twitter.com/Oprah", linked_in: "http://http://www.linkedin.com/pub/maria-lopez/1b/291/a17",
                codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
                blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
                personal_url: "http://www.dolekemp96.org/main.htm", mission: "I am a self-motivated, mother of two who wants to change the world.  Through this experience, I will have the ability to not only change my family's lives, but change the lives of people all over the planet.",
                biography: Faker::Lorem.paragraph(15))

m = Media.create(url: "Jen_small.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)


candidate_ids << c.id


  d = Candidate.create(name: "Fredy Klein", email: "fredy_klein@hotmail.com", password: "test", password_confirmation: "test", phone: Faker::PhoneNumber.phone_number,
                password: "test", password_confirmation: "test", address1: Faker::Address.street_address,
                city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, facebook: "https://www.facebook.com/marialopez",
                twitter: "https://twitter.com/Oprah", linked_in: "http://http://www.linkedin.com/pub/maria-lopez/1b/291/a17",
                codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
                blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
                personal_url: "http://www.dolekemp96.org/main.htm", mission: "I am highly motivated to create extraordinary things. This experience will provide me the perfect introduction into this wonderful industry. I will use those experience to harness my craft and bring happiness to people.",
                biography: Faker::Lorem.paragraph(15))


  candidate_ids << d.id
  m = Media.create(url: "Alex_small.jpg",
             type: "Image", user_id: d.id)
d.update_attributes(profile_photo_id: m.id)


  d = Candidate.create(name: "Kamille Ullrich", email: "kamille_ullrich@gmail.com", password: "test", password_confirmation: "test", phone: Faker::PhoneNumber.phone_number,
                password: "test", password_confirmation: "test", address1: Faker::Address.street_address,
                city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, facebook: "https://www.facebook.com/marialopez",
                twitter: "https://twitter.com/Oprah", linked_in: "http://http://www.linkedin.com/pub/maria-lopez/1b/291/a17",
                codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
                blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
                personal_url: "http://www.dolekemp96.org/main.htm", mission: "I have always been someone who loves to interact with computers and the internet. This scholarship will not only allow me to create amazing things but also create a better community and world.",
                biography: Faker::Lorem.paragraph(15)) 
  candidate_ids << d.id 

    m = Media.create(url: "Tara_small.jpg",
             type: "Image", user_id: d.id)

d.update_attributes(profile_photo_id: m.id)

   d = Candidate.create(name: "Mary Flatley", email: "mary_flatley@gmail.com", password: "test", password_confirmation: "test", phone: Faker::PhoneNumber.phone_number,
                password: "test", password_confirmation: "test", address1: Faker::Address.street_address,
                city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, facebook: "https://www.facebook.com/marialopez",
                twitter: "https://twitter.com/Oprah", linked_in: "http://http://www.linkedin.com/pub/maria-lopez/1b/291/a17",
                codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
                blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
                personal_url: "http://www.dolekemp96.org/main.htm", mission: "I have so many ideas and there is no better way to express them than through computer programming. This experience could change my life and let me reach my full potential.",
                biography: Faker::Lorem.paragraph(15))
  candidate_ids << d.id

    m = Media.create(url: "Jane_small.jpg",
             type: "Image", user_id: d.id)
d.update_attributes(profile_photo_id: m.id)


   d = Candidate.create(name: "Josh Brooks", email: "josh_brooks@gmail.com", password: "test", password_confirmation: "test", phone: Faker::PhoneNumber.phone_number,
                password: "test", password_confirmation: "test", address1: Faker::Address.street_address,
                city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip_code, facebook: "https://www.facebook.com/marialopez",
                twitter: "https://twitter.com/Oprah", linked_in: "http://http://www.linkedin.com/pub/maria-lopez/1b/291/a17",
                codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
                blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
                personal_url: "http://www.dolekemp96.org/main.htm", mission: "For my entire life, I have wanted to make a difference in the world. This scholarship will give me the opportunity to achieve my dreams and change the world.",
                biography: Faker::Lorem.paragraph(15))
  candidate_ids << d.id
    m = Media.create(url: "Harry_small.jpg",
             type: "Image", user_id: d.id)
d.update_attributes(profile_photo_id: m.id)



c = Candidate.first

Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12500, current_campaign: true)

15.times do
  str = ""
  10.times { str << rand(97..122).chr }
  Donation.create(token: str, amount: rand(10..500), donor_id: donor_ids.sample, campaign_id: Campaign.first.id)
end

Donor.all.each do |donor|
  donor.nominations.build(campaign_id: 1, candidate_id: candidate_ids.sample)
  donor.save
end

Candidate.all.each {|c| c.profile_video_id = Video.first.id; c.save }
# Candidate.all.each {|c| c.profile_photo_id = Image.first.id; c.save }

@responses = [
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),
              Faker::Lorem.paragraph(3),

              # "I want to go to dbc to learn tons and help the world!",
              # "I was able to attend the boys and girls club and it helped me",
              # "I once created a community garden",
              # "I would teach youth how to code",
              # "I like to create things and deploy to the internet",
              # "It is a network of users and information that connects the world and makes efficiencies.",
              # "I would connect coders with the non-coding, under resourced youth to bridge the gap and give the youth valuable skills",
              # "My experience teaching myself front-end coding demonstrates I have the will power and motivation to make it through the program. I just want to learn!",
              # "It will allow me to build cool things and make a difference doing so.",
              # "My motivation and desires are all there. Unfortunately, the high price tag and inability to live without my job prevents me from attending",
              # "Fix your profile update to include social media links"
            ]

Application.all.each do |application|
  application.responses.each_with_index do |response, index|
    response.update_attributes(body: @responses[index])
  end
end
