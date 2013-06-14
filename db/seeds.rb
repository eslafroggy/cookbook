# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "open-uri"

recipe_1 = Nokogiri::HTML(open('http://www.simplyrecipes.com/recipes/apple_walnut_gorgonzola_rustic_tart/'))
recipe_2 = Nokogiri::HTML(open('http://www.simplyrecipes.com/recipes/artichoke_lemon_dip/'))
recipe_3 = Nokogiri::HTML(open('http://www.simplyrecipes.com/recipes/asparagus_souffle/'))

a = [recipe_1.css('.recipe-callout h2')[0].text,
		recipe_2.css('.recipe-callout h2')[0].text,
		recipe_3.css('.recipe-callout h2')[0].text]

3.times do |x|
  Recipe.create(:title => a[x])
end
