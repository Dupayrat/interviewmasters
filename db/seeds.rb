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
  interview_date: Date.parse("20/05/2020") ,
  experience_expectation: "At leat 3 years work experience, and a first job in a start-up would be a big plus",
  # UPLOAD JOB DESC:
  user: philippe
  )
alan_sales.save!

backmarket_webdev = InterviewPreparation.new(
  company: "Back Market",
  job: "Web Developer Full Stack",
  interview_date: Date.parse("10/05/2020"),
  experience_expectation: "Computer sciences degrees and 2 years work on Rails & Javascript",
  missions_attributes: [{name:"Improve front end using Javascript & Rails tech"}, {name:"Develop new functionalities"}, {name:"Develop back-end feature from conception to delivery"}],
  hardskills_attributes: [{hard_skill:"Javascript"}, {hard_skill:"CSS"}, {hard_skill:"IA (notions)"}],
  softskills_attributes: [{soft_skill:"Team player"}, {soft_skill:"Logical mind"}, {soft_skill:"Adaptability"}],
  # UPLOAD JOB DESC:
  user: anthony
  )
backmarket_webdev.save!

protonmail_pm = InterviewPreparation.new(
  company: "Proton Mail",
  job: "Product Manager",
  interview_date: Date.parse("12/05/2020"),
  experience_expectation: "First work experience in tech companies, 1 year minimum",
  missions_attributes: [{name:"Design a mobile app in 12 months for fintech"}, {name:"Lead product priorization for fintech"}, {name:"Be the scrum master for team, leading stand up meetings"}],
  hardskills_attributes: [{hard_skill:"iOS"}, {hard_skill:"Python"}, {hard_skill:"SCRUM"}],
  softskills_attributes: [{soft_skill:"Team player"}, {soft_skill:"Management"}, {soft_skill:"Adaptability"}],
  # UPLOAD JOB DESC:
  user: anthony
  )
protonmail_pm.save!

doctolib_sales = InterviewPreparation.new(
  company: "Doctolib",
  job: "Sales",
  interview_date: Date.parse("28/06/2020"),
  experience_expectation: "Previous experience in sales, hitting targets, in fast-paced environments",
  # UPLOAD JOB DESC:
  missions_attributes: [{name:"Hitting sales target in B2B"}, {name:"Training your team to hit sales target"}, {name:"Ongoing improvement over methods & processes"}],
  hardskills_attributes: [{hard_skill:"Sales B2B"}, {hard_skill:"SaaS"}, {hard_skill:"Negotiation"}],
  softskills_attributes: [{soft_skill:"Team player"}, {soft_skill:"Management"}, {soft_skill:"Adaptability"}],
  user: anthony
  )
doctolib_sales.save!

toogoodtogo_mobiledev = InterviewPreparation.new(
  company: "TooGoodToGo",
  job: "Mobile Developer",
  interview_date: Date.parse("20/06/2020"),
  experience_expectation: "Develop killer mobil app features",
  # UPLOAD JOB DESC:
  missions_attributes: [{name:"Develop new mobile features Android & iOS"}, {name:"Maintain security and release new versions"}, {name:"Act as scrum Master for the team"}],
  hardskills_attributes: [{hard_skill:"iOS"}, {hard_skill:"Android"}, {hard_skill:"SCRUM"}],
  softskills_attributes: [{soft_skill:"Team player"}, {soft_skill:"Logical mind"}, {soft_skill:"Adaptability"}],
  user: anthony
  )
toogoodtogo_mobiledev.save!

manomano_software = InterviewPreparation.new(
  company: "ManoMano",
  job: "Software Engineer",
  interview_date: Date.parse("15/06/2020"),
  experience_expectation: "5 years as a software engineer developping products. Good knowledge of PHP",
  missions_attributes: [{name:"Analyze, design and develop tests and test-automation suites."}, {name:"Provide ongoing maintenance, support and enhancements in existing systems and platforms."}, {name:"Design and develop a processing platform using various configuration management technologies."}],
  hardskills_attributes: [{hard_skill:"Database (Posgresql, Sqlite3)"}, {hard_skill:"C++"}, {hard_skill:"Java"}],
  softskills_attributes: [{soft_skill:"Team player"}, {soft_skill:"Logical mind"}, {soft_skill:"Adaptability"}],
  # UPLOAD JOB DESC:
  user: anthony
  )
manomano_software.save!

puts 'interview preparations created...'

puts 'Creating Back Market challenges...'

back_market_challenge_1 = Challenge.new(name: "Watch top 6 videos", statut: "Done", interview_preparation_id: backmarket_webdev.id)
back_market_challenge_1.save!
back_market_challenge_2 = Challenge.new(name: "Read top 4 articles", statut: "Done", interview_preparation_id: backmarket_webdev.id)
back_market_challenge_2.save!
back_market_challenge_3 = Challenge.new(name: "Objectives and challenges", statut: "Done", interview_preparation_id: backmarket_webdev.id)
back_market_challenge_3.save!
back_market_challenge_4 = Challenge.new(name: "Motivations & vision", statut: "Done", interview_preparation_id: backmarket_webdev.id)
back_market_challenge_4.save!
back_market_challenge_5 = Challenge.new(name: "Business model & competition", statut: "Done", interview_preparation_id: backmarket_webdev.id)
back_market_challenge_5.save!
back_market_challenge_6 = Challenge.new(name: "Questions for the interviewer", statut: "Done", interview_preparation_id: backmarket_webdev.id)
back_market_challenge_6.save!
back_market_challenge_7 = Challenge.new(name: "Similar profiles", statut: "Done", interview_preparation_id: backmarket_webdev.id)
back_market_challenge_7.save!
back_market_challenge_8 = Challenge.new(name: "Use the STAR approach", statut: "Done", interview_preparation_id: backmarket_webdev.id)
back_market_challenge_8.save!

puts 'Back Market challenges created...'

puts 'Creating Protonmail challenges...'

protonmail_challenge_1 = Challenge.new(name: "Watch top 6 videos", statut: "Done", interview_preparation_id: protonmail_pm.id)
protonmail_challenge_1.save!
protonmail_challenge_2 = Challenge.new(name: "Read top 4 articles", statut: "Done", interview_preparation_id: protonmail_pm.id)
protonmail_challenge_2.save!
protonmail_challenge_3 = Challenge.new(name: "Objectives and challenges", statut: "Done", interview_preparation_id: protonmail_pm.id)
protonmail_challenge_3.save!
protonmail_challenge_4 = Challenge.new(name: "Motivations & vision", statut: "Done", interview_preparation_id: protonmail_pm.id)
protonmail_challenge_4.save!
protonmail_challenge_5 = Challenge.new(name: "Business model & competition", statut: "Done", interview_preparation_id: protonmail_pm.id)
protonmail_challenge_5.save!
protonmail_challenge_6 = Challenge.new(name: "Questions for the interviewer", statut: "Done", interview_preparation_id: protonmail_pm.id)
protonmail_challenge_6.save!
protonmail_challenge_7 = Challenge.new(name: "Similar profiles", statut: "Done", interview_preparation_id: protonmail_pm.id)
protonmail_challenge_7.save!

puts 'Prontomail challenges created...'

puts 'Creating Doctolib challenges...'

doctolib_challenge_1 = Challenge.new(name: "Watch top 6 videos", statut: "Done", interview_preparation_id: doctolib_sales.id)
doctolib_challenge_1.save!
doctolib_challenge_2 = Challenge.new(name: "Read top 4 articles", statut: "Done", interview_preparation_id: doctolib_sales.id)
doctolib_challenge_2.save!

puts 'Doctolib challenges created...'

puts 'Creating ToGoodToGo challenges...'

toogoodtogo_challenge_1 = Challenge.new(name: "Watch top 6 videos", statut: "Done", interview_preparation_id: toogoodtogo_mobiledev.id)
toogoodtogo_challenge_1.save!
toogoodtogo_challenge_2 = Challenge.new(name: "Read top 4 articles", statut: "Done", interview_preparation_id: toogoodtogo_mobiledev.id)
toogoodtogo_challenge_2.save!
toogoodtogo_challenge_3 = Challenge.new(name: "Objectives and challenges", statut: "Done", interview_preparation_id: toogoodtogo_mobiledev.id)
toogoodtogo_challenge_3.save!
toogoodtogo_challenge_4 = Challenge.new(name: "Motivations & vision", statut: "Done", interview_preparation_id: toogoodtogo_mobiledev.id)
toogoodtogo_challenge_4.save!

puts 'ToGoodToGo challenges created...'

puts 'Creating ManoMano challenges...'

manomano_challenge_1 = Challenge.new(name: "Watch top 6 videos", statut: "Done", interview_preparation_id: manomano_software.id)
manomano_challenge_1.save!
manomano_challenge_2 = Challenge.new(name: "Read top 4 articles", statut: "Done", interview_preparation_id: manomano_software.id)
manomano_challenge_2.save!
manomano_challenge_3 = Challenge.new(name: "Objectives and challenges", statut: "Done", interview_preparation_id: manomano_software.id)
manomano_challenge_3.save!
manomano_challenge_4 = Challenge.new(name: "Motivations & vision", statut: "Done", interview_preparation_id: manomano_software.id)
manomano_challenge_4.save!
manomano_challenge_5 = Challenge.new(name: "Business model & competition", statut: "Done", interview_preparation_id: manomano_software.id)
manomano_challenge_5.save!
manomano_challenge_6 = Challenge.new(name: "Questions for the interviewer", statut: "Done", interview_preparation_id: manomano_software.id)
manomano_challenge_6.save!

puts 'ManoMano challenges created...'








