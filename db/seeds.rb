# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

5.times do |_index|
  new_user = User.create!(email: Faker::Internet.email,
                          password: Faker::Internet.password(min_length: 8, max_length: 10))
  5.times do |_index|
    new_user.posts.create!(title: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop,
                           content: Faker::Lorem.paragraph(sentence_count: 10),
                           likes: Faker::Number.between(from: 0, to: 100))
  end
end

200.times do |_index|
  Comment.create!(content: Faker::Lorem.paragraph(sentence_count: 3),
                  likes: Faker::Number.between(from: 0, to: 100),
                  user_id: Faker::Number.between(from: User.minimum(:id), to: User.maximum(:id)),
                  post_id: Faker::Number.between(from: Post.minimum(:id), to: Post.maximum(:id)))
end

puts "Created #{User.count} User"
puts "Created #{Post.count} Posts"
puts "Created #{Comment.count} Comments"
