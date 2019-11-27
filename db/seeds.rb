User.create!(username: "Example User",
  email: "example@railstutorial.org",
  phone: "0123456780",
  address: "88 khuong dinh stress",
  password: "123456",
  role: 1)
9.times do |n|
name  = "Example #{n+1} User"
email = "example-#{n+1}@railstutorial.org"
password = "123456"
phone = "012345678#{n+1}"
address = "#{n+1} khuong dinh stress"
User.create!(
  username: name,
  email: email,
  phone: phone,
  address: address,
  password: password,
  role: 2)
end
