# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Sub.destroy_all

user1 = User.create!(username: 'max!', password: 'hunter2')
user2 = User.create!(username: 'izzi', password: 'hunter12')
user3 = User.create!(username: 'joe', password: 'hunter3')
user4 = User.create!(username: 'walker', password: 'hunter4')
user5 = User.create!(username: 'michelle', password: 'hunter1')

sub1 = Sub.create!(title: 'politics', description: 'about politics', moderator_id: user1.id)
sub2 = Sub.create!(title: 'baking', description: 'food!', moderator_id: user2.id)
sub3 = Sub.create!(title: 'ruby', description: 'not the gem', moderator_id: user3.id)

