# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Color.create!(name: 'blue', hex_code: '#026aa7')
Color.create!(name: 'orange', hex_code: '#d29034')
Color.create!(name: 'green', hex_code: '#519839')
Color.create!(name: 'red', hex_code: '#b04632')
Color.create!(name: 'purple', hex_code: '#89609e')
Color.create!(name: 'pink', hex_code: '#cd5a91')
Color.create!(name: 'light green', hex_code: '#4bbf6b')
Color.create!(name: 'light blue', hex_code: '#00aecc')
Color.create!(name: 'gray', hex_code: '#838c91')
puts 'Colors Created'
