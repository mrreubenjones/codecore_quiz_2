# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

departments = ["Marketing", "Sales", "Technical"]
status = [true, false]

1000.times do
  Request.create({  name:  Faker::Name.name,
                    email:   Faker::Internet.email,
                    department: departments.sample,
                    message: Faker::StarWars.quote,
                    done: status.sample
                  })

end