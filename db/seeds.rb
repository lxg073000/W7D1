# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


COLOR = ['black', 'white', 'brown', 'tabby']
SEX = ['M', 'F']

Cat.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('cats')

20.times do
  kitty = Cat.create(
    birth_date: Faker::Date.between(from: '1900-09-23', to: Date.today),
    color: COLOR.sample,
    name: Faker::Hipster.word.titleize,
    sex: SEX.sample,
    description: Faker::TvShows::Seinfeld.quote
  )


end
