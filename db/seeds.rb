# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Note: Apartment is using the User#database attribute here to separate its schemas

User.find_or_create_by(name: 'Nick', database: 'nick_db')
User.find_or_create_by(name: 'Daniela', database: 'daniela_db')

# Create Posts for Nick

Apartment::Tenant.switch('nick_db')

Post.find_or_create_by(body: "Nick's Post 1")
Post.find_or_create_by(body: "Nick's Post 2")

# Create Posts for Daniela

Apartment::Tenant.switch('daniela_db')

Post.find_or_create_by(body: "Daniela's Post 1")
Post.find_or_create_by(body: "Daniela's Post 2")
Post.find_or_create_by(body: "Daniela's Post 3")
Post.find_or_create_by(body: "Daniela's Post 4")
