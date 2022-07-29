
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

  rand(5..20).times do
    user.articles.create(
      message: Faker::Lorem.paragraph_by_chars(number: 120, supplemental: false),
      created_at: Faker::Date.between(from: 20.days.ago, to: Date.today)
    )
  end
end
