# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all

cities = []
users = []
gossips = []
tags = []

10.times do
  city = City.create(name: Faker::Address.city)
  cities << city
  puts "CITY ====> #{city.name} created"
end

10.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, description: Faker::Lorem.sentence(word_count: 50), age: Faker::Number.within(range: 18..99), city: cities.sample, password: 'foobar')
  users << user
  puts "USER  ====> #{user.first_name} created"
end

20.times do
  gossip = Gossip.create(title: Faker::Lorem.sentence(word_count: 3), content: Faker::Lorem.sentence(word_count: 30), user: users.sample)
  gossips << gossip
  puts "GOSSIP  ====> #{gossip.title} a été créé"
end

10.times do
  tag = Tag.create(title: Faker::Lorem.word)
  tags << tag
  puts "TAGE  ====> #{tag.title} a été créé"
end

Gossip.all.each do |gos|
  TagGossip.create(gossip: gos, tag: tags.sample)
  puts 'TAG-GOSSIP CRÉÉ'
end
