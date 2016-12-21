# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_list = [['Animal-based food', 'Its time to enjoy life. Get all your sweet animal products here.'],['Plant-based food','The home of 100% vegeterian and organically grown products.'],['Farm-input',' Get yourself some farm-input. Get the best of your farm.']]

category_list.each do |category|
  Category.create( :name => category[0], :description => category[1])
end
