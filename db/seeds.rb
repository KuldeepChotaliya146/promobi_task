# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
course_names = ["Javascript", "Data science"]
course_names.each do |course|
  course = Course.find_or_create_by(name: course)
  2.times do
    course.tutors.find_or_create_by(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end
end