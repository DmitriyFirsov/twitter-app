# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
  {
    name: "John",
    surname: "Smith"
  },
  {
    name: "Alan",
    surname: "Watts"
  },
  {
    name: "Hilary",
    surname: "Shepherd"
  },
  {
    name: "Jack",
    surname: "Howard"
  },
  {
    name: "John",
    surname: "Doe"
  }
]

def make_email(data)
  "#{data[:name].downcase}.#{data[:surname].downcase}@example.com"
end

user_list.each do |user_item|
  user = User.new(
    user_item.merge(
      {
        password: "Password1234!",
        email: make_email(user_item)
      }
    )
  )

  user.save

  (0..Random.new.rand(5..20)).each do |_i|
    user.articles.create do |new_article|
      new_article.message = Faker::Lorem.paragraph_by_chars(number: 120, supplemental: false)
      new_article.created_at = Faker::Date.between(from: 20.days.ago, to: Date.today)
    end
  end
end
