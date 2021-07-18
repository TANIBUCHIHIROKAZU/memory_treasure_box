# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'test@test.com',
   password: 'testtest'
)

Customer.create!(
  [
    {
      name: "練習太郎1",
      email: "tanibuchi1123@gmail.com",
      customer_number: "tanibuchi11",
      is_active: true,
      password: "1121desu",
    },
    {
      name: "練習太郎2",
      email: "tanibuchi1124@gmail.com",
      customer_number: "tanibuchi12",
      is_active: true,
      password: "1121desu",
    },
    {
      name: "練習太郎3",
      email: "tanibuchi1125@gmail.com",
      customer_number: "tanibuchi13",
      is_active: true,
      password: "1121desu",
    },
    {
      name: "練習太郎4",
      email: "tanibuchi1126@gmail.com",
      customer_number: "tanibuchi14",
      is_active: true,
      password: "1121desu",
    }
  
  
  ]
  )