# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Cleaning DB
puts 'Deleting users...'
User.destroy_all
puts 'Deleting interviw preparations...'
InterviewPreparation.destroy_all

puts 'Creating users...'

anthony = User.new(
    first_name: "Anthony",
    last_name: "Christen",
    email:    "antho@gmail.com",
    password: "123456",
    role: "candidate"
    # image:
    )
anthony.save!

philippe = User.new(
    first_name: "Philippe",
    last_name: "du Payrat",
    email:    "philippedupayrat@gmail.com",
    password: "123456",
    role: "candidate"
    # image:
    )
philippe.save!

johnjohn = User.new(
    first_name: "John-John",
    last_name: "de Weerdt",
    email:    "johnjohn20015@hotmail.com",
    password: "123456",
    role: "candidate"
    # image:
    )
johnjohn.save!

philippe_circles = User.new(
    first_name: "Philippe",
    last_name: "circles.work",
    email:    "philippe@circles.work",
    password: "123456",
    role: "coach",
    industry: "start-up, mobility, recruiting",
    skills: "sales, strategy, recruiting",
    description: "As a manager in start-up & scale-up, I know what the expectations are for successful candidates, as well as potential pitfalls."
    # image:
    )
philippe_circles.save!

puts 'Users created...'

puts 'Creating interview preparations...'
alan_sales = InterviewPreparation.new(
  company: "Alan",
  job: "Business Developer",
  interview_date: Date.parse("20/06/2020") ,
  experience_expectation: "At leat 3 years work experience, and a first job in a start-up would be a big plus",
  # UPLOAD JOB DESC:
  user: philippe
  )
alan_sales.save!

migros_webdev = InterviewPreparation.new(
  company: "Migros",
  job: "Web Developer Full Stack",
  interview_date: Date.parse("01/07/2020"),
  experience_expectation: "Computer sciences degrees and 2 years work on Rails & Javascript",
  # UPLOAD JOB DESC:
  user: johnjohn
  )
migros_webdev.save!

protonmail_pm = InterviewPreparation.new(
  company: "Proton Mail",
  job: "Product Manager",
  interview_date: Date.parse("15/06/2020"),
  experience_expectation: "First work experience in tech companies, 1 year minimum",
  # UPLOAD JOB DESC:
  user: anthony
  )
protonmail_pm.save!


puts 'interview preparations created...'

