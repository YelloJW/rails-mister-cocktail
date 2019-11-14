# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'starting seed'
cocktails_string = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
puts 'parsing'
cocktails_hash = JSON.parse(cocktails_string)
puts 'returning hash'
p cocktails_hash
puts 'iterating'
cocktails_hash['drinks'].each do |cocktail|
  Ingredient.create!(name: cocktail['strIngredient1'])
end
