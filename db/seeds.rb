# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create(name: 'admin', password: 'password', password_confirmation: 'password')

admin = User.find_by(name: 'admin')
admin.tasklists.create(name: 'ALPHA Camp')
150.times do
  admin.tasklists.create(name: Faker::Company.name)
end



alpha_camp = Tasklist.find_by(name: 'ALPHA Camp')

28.times do
  alpha_camp.tasks.create(name: Faker::ProgrammingLanguage.name, due_date: Faker::Date.between(Date.today, 30.days.from_now), status: Faker::Boolean.boolean)
end
