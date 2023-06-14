require 'faker'

puts '🌱 Seeding Movies...'

Production.destroy_all
CrewMember.destroy_all

Production.create(title: 'walking Dead', genre: 'Horror', budget: 15000.00, image: 'https://www.pexels.com/photo/person-in-black-coat-standing-in-forest-194917/')
Production.create(title: 'Come together', genre: 'family', budget: 10000.00, image: 'https://www.pexels.com/photo/children-together-in-traditional-robes-16175757/')
Production.create(title: 'Talent', genre: 'Sports', budget: 13000.00, image: 'https://www.pexels.com/photo/sport-high-united-states-of-america-ball-2346/')
Production.create(title: 'Twin tower', genre: 'war', budget: 12000.00, image: 'https://www.pexels.com/photo/5-soldiers-holding-rifle-running-on-white-sand-during-daytime-87772/')
Production.create(title: 'Technology', genre: 'Cyber attacks', budget: 14000.00, image: 'https://www.pexels.com/photo/code-projected-over-woman-3861969/')

40.times do
  CrewMember.create(
    name: Faker::Name.name,
    job_title: 'stagehand',
    salary: 80000.00,
    production: Production.all.sample
  )
end

puts '✅ Done seeding'
