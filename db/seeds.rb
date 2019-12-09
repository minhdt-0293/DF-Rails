require "ffaker"

p "Migrate data"

img_path = Rails.root.join("public", "uploads", "images")

ActiveRecord::Base.transaction do

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

  ["Coffee Latte", "Coffee Bean", "Espresso", "Sprudge"].each do |name|
    category = Category.create!(
      name: name,
      image: FFaker::Image.url("75x75"),
      description: "This is #{name}"
    )

    8.times do |name|
      random = rand(1..16)
      image = File.open("#{img_path}/drinks/#{random}.jpg")
      category.products.create!(
        name: FFaker::Name.name,
        price: rand(50..200),
        quantity: rand(1..40),
        product_type: 1,
        description: "This is #{name}",
        image: image
      )
    end
  end

  ["Fast Food", "Pizza", "Cream", "Chocolate"].each do |name|
    category = Category.create!(
      name: name,
      image: FFaker::Image.url("75x75"),
      description: "This is #{name}"
    )
    12.times do |name|
      random = rand(1..20)
      image = File.open("#{img_path}/foods/#{random}.jpeg")
      category.products.create!(
        name: FFaker::Name.name,
        price: rand(50..200),
        quantity: rand(1..40),
        product_type: 2,
        description: "This is #{name}",
        image: image
      )
    end
  end
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
