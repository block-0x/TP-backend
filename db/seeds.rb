users = [
  {
    id: 1,
    email: "test@example.com",
    name: "テストユーザー",
    image: open("./db/fixtures/users/testuser.jpg"),
    gender: 0,
    birthday: "2000-01-01",
    profile: "テストユーザーです。どうぞよろしくお願いします。",
    prefecture: 13,
  },
  {
    id: 2,
    email: "fox@example.com",
    name: "キツネ",
    image: open("./db/fixtures/users/fox.png"),
    gender: 1,
    birthday: "1988-06-11",
    profile: "キツネです。どうぞよろしくお願いします。",
    prefecture: 13,
  },
  {
    id: 3,
    email: "bear@example.com",
    name: "クマ",
    image: open("./db/fixtures/users/bear.png"),
    gender: 1,
    birthday: "1982-11-02",
    profile: "クマです。どうぞよろしくお願いします。",
    prefecture: 13,
  },
  {
    id: 4,
    email: "monkey@example.com",
    name: "サル",
    image: open("./db/fixtures/users/monkey.png"),
    gender: 1,
    birthday: "1993-02-13",
    profile: "サルです。どうぞよろしくお願いします。",
    prefecture: 13,
  },
  {
    id: 5,
    email: "wolf@example.com",
    name: "オオカミ",
    image: open("./db/fixtures/users/wolf.png"),
    gender: 1,
    birthday: "1986-12-24",
    profile: "オオカミです。どうぞよろしくお願いします。",
    prefecture: 13,
  },
  {
    id: 6,
    email: "pig@example.com",
    name: "ブタ",
    image: open("./db/fixtures/users/pig.png"),
    gender: 1,
    birthday: "2000-08-29",
    profile: "ブタです。どうぞよろしくお願いします。",
    prefecture: 13,
  },
  {
    id: 7,
    email: "cat@example.com",
    name: "ネコ",
    image: open("./db/fixtures/users/cat.png"),
    gender: 1,
    birthday: "1995-02-10",
    profile: "ネコです。どうぞよろしくお願いします。",
    prefecture: 13,
  },
]

puts "Start creating users..."

users.each do |user|
  User.create(
    email: user[:email],
    password: "password",
    name: user[:name],
    image: user[:image],
    gender: user[:gender],
    birthday: user[:birthday],
    profile: user[:profile],
    prefecture: user[:prefecture],
  )
end

puts "Completed!"

likes = [
  {
    from_user_id: 2,
    to_user_id: 1,
  },
  {
    from_user_id: 3,
    to_user_id: 1,
  },
  {
    from_user_id: 4,
    to_user_id: 1,
  },
  {
    from_user_id: 5,
    to_user_id: 1,
  },
  {
    from_user_id: 6,
    to_user_id: 1,
  }
]

puts "Start creating likes..."

likes.each do |like|
  Like.create(
    from_user_id: like[:from_user_id],
    to_user_id: like[:to_user_id]
  )
end

puts "Completed!"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Content createing likes..."
Content.create(title: "Ruby", summary: "1995年に一般公開されたオブジェクト指向スクリプト言語です。")
Content.create(title: "Python", summary: "C言語などと比較して分かりやすい文法が特徴です。")
Content.create(title: "JavaScript", summary: "JavaScript は、クロスプラットフォームで動作するオブジェクト指向のスクリプト言語")
puts "Completed!"
