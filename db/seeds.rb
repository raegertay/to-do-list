# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

admin = User.create(email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')

45.times do
  tasklist = admin.tasklists.create(name: Faker::Company.name)
  10.times do
    tasklist.tasks.create(name: Faker::ProgrammingLanguage.name, due_date: Faker::Date.between(Date.today, 30.days.from_now), status: Faker::Boolean.boolean)
  end
end
