Image.create(url: "thinker.jpg")

donor_ids = []
candidate_ids = []

life_questions = ["Briefly introduce yourself with any information you think is important",
                  "Tell us about an experience from your life that has influenced your development as a person.",
                  "Describe your most meaningful achievement that has made an impact in your community",
                  "How would you utilize your experience from this program to give back to your community?"]

tech_questions = ["What is it about technology or coding that excites you?",
                  "Tell us your understanding of how the internet works in 200 words or less.",
                  "Tell us how you will use the internet to change the world?",
                  "Include a few links below that demonstrate your current interest in coding (github account, codeacademy profile, ect.)."]

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
                city: "Chicago", state: "IL", zip: "60600", twitter: "http://www.twitter.com/kevinAnother22",
                facebook: "https://facebook.com/kevinanother22", blog: "http://kevinanother.tumblr.com")
candidate_ids << c.id

m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)



c = Candidate.create(name: "Tiffany Another", email: "tiffany@another.com", phone: "456-789-1023",
                password: "test", password_confirmation: "test", address1: "456 Sesame Way",
                city: "Boise", state: "ID", zip: "78012", facebook: "https://www.facebook.com/oprahwinfrey",
                twitter: "https://twitter.com/Oprah", linked_in: "http://www.linkedin.com/pub/lebron-james/37/901/43a?trk=pub-pbmap",
                codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
                blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
                personal_url: "http://www.dolekemp96.org/main.htm", mission: "Go to DBC!",
                biography: "Akwardly talk about myself")

candidate_ids << c.id
m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)

c = Candidate.create(name: "Kenan Thompson", email: "kenan@thompson.com", phone: "634-345-7253",
                password: "test", password_confirmation: "test", address1: "29801 Fort Thomas Pike",
                address2: "Apt. 3D", city: "Nashville", state: "TN", zip: "37211", facebook: "https://www.facebook.com/oprahwinfrey",
                twitter: "https://twitter.com/Oprah", linked_in: "http://www.linkedin.com/pub/lebron-james/37/901/43a?trk=pub-pbmap",
                codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
                blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
                personal_url: "http://www.dolekemp96.org/main.htm", mission: "Go to DBC!",
                biography: "Akwardly talk about myself")

candidate_ids << c.id
m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)

c = Candidate.create(name: "Maria Lopez", email: "maria@lopez.com", phone: "928-356-1535",
                password: "test", password_confirmation: "test", address1: "87 West North Ave",
                city: "Gainesville", state: "FL", zip: "34535", facebook: "https://www.facebook.com/oprahwinfrey",
                twitter: "https://twitter.com/Oprah", linked_in: "http://www.linkedin.com/pub/lebron-james/37/901/43a?trk=pub-pbmap",
                codeacademy: "http://www.codecademy.com/kberr18", github: "https://github.com/bill-gates",
                blog: "http://www.buzzfeed.com/bennyjohnson/you-should-be-sad-the-internet-was-not-around-for",
                personal_url: "http://www.dolekemp96.org/main.htm", mission: "Go to DBC!",
                biography: "Akwardly talk about myself")

candidate_ids << c.id
m = Media.create(url: "http://kaynou.files.wordpress.com/2011/01/oprah-winfrey-named-petas-person-of-the-5283.jpg",
             type: "Image", user_id: c.id)
c.update_attributes(profile_photo_id: m.id)

m = Media.create(url: "http://www.youtube.com/watch?v=BU3jfbb172E",
             type: "Video", user_id: c.id)
c.update_attributes(profile_video_id: m.id)

c = Candidate.first

Campaign.create(candidate: c, start_date: "31/10/2013", end_date: "31/12/2013", total: 0, goal: 12000)

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
Candidate.all.each {|c| c.profile_photo_id = Image.first.id; c.save }

@responses = ["I want to go to dbc to learn tons and help the world!",
              "I was able to attend the boys and girls club and it helped me",
              "I once created a community garden",
              "I would teach youth how to code",
              "I like to create things and deploy to the internets",
              "It is like files and servers and facebook",
              "I dunno maybe make a cool app",
              "THIS NEEDS TO BE UPDATED",
              "I JUST WILL YOU HEARD?",
              "It will allow me to have a good job",
              "A lot but mostly my awesomeness",
              "I dunno maybe fix your profile update social media input stuff"]

Application.all.each do |application|
  application.responses.each_with_index do |response, index|
    response.update_attributes(body: @responses[index])
  end
end
