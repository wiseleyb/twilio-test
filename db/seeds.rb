# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

u = User.create!(username: 'wiseleyb')

5.times.each do |i|
  Contact.create!(user_id: u.id,
                  group: 'test',
                  name: "Ben Wiseley #{i}",
                  phone: '+14154055410')
end
