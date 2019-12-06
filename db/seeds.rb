require "ffaker"

User.create!(
  username: "Admin",
  email: "admin@gmail.com",
  phone: "0123456780",
  address: "Floor 13, Landmark Tower",
  password: "123456",
  role: 1)

9.times do |n|
  name  = FFaker::NameVN.name
  email = FFaker::Internet.disposable_email
  password = "123456"
  phone = FFaker::PhoneNumber.phone_number
  address = FFaker::AddressUS.street_address

  User.create!(
    username: name,
    email: email,
    phone: phone,
    address: address,
    password: password,
    role: 2)
end

10.times do |n|
  category = Category.create!(
    name: FFaker::Food.fruit,
    parent_id: 0,
    image: FFaker::Image.url("75x75"),
    description: FFaker::Lorem.paragraphs
  )
end

5.times do |n|
  5.times do |m|
    Product.create!(
      category_id: m+1,
      name: FFaker::Lorem.sentence(3),
      price: rand(10..99),
      quantity: rand(1..40),
      description: FFaker::Lorem.paragraphs,
      image: FFaker::Image.url("75x75"),
    )
  end
end
