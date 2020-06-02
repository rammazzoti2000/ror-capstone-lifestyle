# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  name = Faker::Name.unique.name
  username = Faker::Internet.user_name
  email = "example-#{n+1}@railstutorial.org"
  password = 'password'

  User.create!(name: name,
               username: username,
               email: email,
               password: password)
end

5.times do |n|
  title = Faker::Lorem.sentence(word_count: 3)
  text = Faker::Lorem.paragraph(sentence_count: 4)
  featured_image = Faker::LoremFlickr.image
  tag = Faker::Lorem.sentence(word_count: 1)
  author_id = "#{n + 1}"
  category_id = "#{n + 1}"
  status = 'published'

  Article.create!(title: title,
                  text: text,
                  featured_image: featured_image,
                  tag: tag,
                  author_id: author_id,
                  category_id: category_id,
                  status: status)
end
