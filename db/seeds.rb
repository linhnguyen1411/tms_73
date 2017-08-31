# gem faker.different of create! and create method is it raises an exception for
# an invalid user instead return false. makes debugger easier than silent errors
User.delete_all
User.create!(
  name:  "Huynh Thanh Tung", email: "thanhtungcnttk13@gmail.com", password: "123456",
  password_confirmation: "123456", role: 0, activated: true,avatar: "logo.png",
  activated_at: Time.zone.now
)
User.create!(
  name:  "Linh Nguyen", email: "linhnguyencmu@gmail.com", password: "123456",
  password_confirmation: "123456", role: 0, activated: true, avatar: "ac.jpg",
  activated_at: Time.zone.now
)
User.create!(
  name:  "Test Nguyen", email: "t@gmail.com", password: "123456",
  password_confirmation: "123456", role: 0, activated: true, avatar: "ac.jpg",
  activated_at: Time.zone.now
)
User.create!(
  name:  "Trainer Nguyen", email: "tn1@gmail.com", password: "123456",
  password_confirmation: "123456", role: 1, activated: true, avatar: "logo.png",
  activated_at: Time.zone.now
)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
    name: name, email: email, password: password, avatar: "logo.png",
    password_confirmation: password, activated: true, activated_at: Time.zone.now
  )
end
