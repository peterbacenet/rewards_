# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Peter", password: "password")

Partner.create(name: "DANNON")
Partner.create(name: "UNILEVER")
Partner.create(name: "MILLER COORS")

Transaction.create(user_id: 1, partner_id: 1, points: 300, redeemed: false, timestamp: "2020-10-31T10:00:00Z")
Transaction.create(user_id: 1, partner_id: 1, points: -200, redeemed: false, timestamp: "2020-10-31T15:00:00Z")
Transaction.create(user_id: 1, partner_id: 2, points: 200, redeemed: false, timestamp: "2020-10-31T11:00:00Z" )
Transaction.create(user_id: 1, partner_id: 3, points: 10000, redeemed: false, timestamp: "2020-11-01T14:00:00Z" )
Transaction.create(user_id: 1, partner_id: 1, points: 1000, redeemed: false, timestamp: "2020-11-02T14:00:00Z")