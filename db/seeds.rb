# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


body_text=[["How are you","I love you so much"],["I couldn't live without you","You are my favorite"], ["I don't know what I would do without you", "I was just thinking about you"]]
email=[["Hi","I was having a fun day and started to think about you.  What are you up to?"],["I love you","I was just checking in to say how much I love you"]]

body_text.each do |body|
	MessageTemplate.create subject: body[0], body: body[1], medium_id: 1
end

email.each do |e|
	MessageTemplate.create subject: e[0], body: e[1], medium_id: 0
end
