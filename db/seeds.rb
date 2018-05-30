# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Color.create!(name: 'blue', hex_code: '#026aa7', secondary_hex_code: '#004fba')
Color.create!(name: 'orange', hex_code: '#d29034', secondary_hex_code: '#b67937')
Color.create!(name: 'green', hex_code: '#519839', secondary_hex_code: '#26700d')
Color.create!(name: 'red', hex_code: '#b04632', secondary_hex_code: '#760d03')
Color.create!(name: 'purple', hex_code: '#89609e', secondary_hex_code: '#704475')
Color.create!(name: 'pink', hex_code: '#cd5a91', secondary_hex_code: '#a1306f')
Color.create!(name: 'light green', hex_code: '#4bbf6b', secondary_hex_code: '#00813d')
Color.create!(name: 'light blue', hex_code: '#00aecc', secondary_hex_code: '#006a88')
Color.create!(name: 'gray', hex_code: '#838c91', secondary_hex_code: '#444444')
puts 'Colors Created'
