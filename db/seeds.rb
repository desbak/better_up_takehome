# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'csv'
data = CSV.read("db/seed_coach_data.csv", headers: true)


# clean up the input
coaches = {}
data.each do |row|
	coach_name = row[0]
	unless coaches.key? coach_name
		# assumption: no multiple tz per coach
		coaches[coach_name] = {availabilities: [], time_zone: row[1]}
	end

	coaches[coach_name][:availabilities] << { day: row[2],
		                                      start: row[3],
		                                      end: row[4]}
end


# create the coaches and their availabilities
coaches.each do |key, value|
	coach = Coach.new(name: key, time_zone: value[:time_zone])
	coach.save!

	puts coach.name

	value[:availabilities].each do |avail|
		# create 30 min blocks for each
		a = AvailabilityBlock.new(coach_id: coach.id,
			                      day: avail[:day],
			                      start_time: avail[:start],
			                      end_time: avail[:end])

		puts avail[:day]
		
		current_start = a.start_time
		current_end = a.start_time + 30.minutes
		while current_end <= a.end_time
			b = AvailabilityBlock.new(coach_id: coach.id,
			                          day: avail[:day],
			                          start_time: current_start,
			                          end_time: current_end)
			b.save!

			puts b.start_time

			current_start += 30.minutes
			current_end += 30.minutes
		end

	end
end
