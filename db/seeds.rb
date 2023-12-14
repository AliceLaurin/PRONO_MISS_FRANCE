# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# MyWinner.destroy_all
# MyTop5.destroy_all
# MyTop12.destroy_all
# RealWinner.destroy_all
# RealTop5.destroy_all
# RealTop12.destroy_all
# Category.destroy_all
Score.destroy_all
RealWinner.destroy_all
GroupUser.destroy_all
Group.destroy_all
User.destroy_all
Miss.destroy_all
Year.destroy_all


puts "creating years..."
year_1 = Year.create!(
  year: "2024",
  date: "Wed, 13 Dec 2023 13:47:58.455031000 UTC +00:00",
  status: "terminé"
)
year_1.save!

year_2 = Year.create!(
  year: "2025",
  date: "Wed, 18 Dec 2024 13:47:58.455031000 UTC +00:00",
  status: "en cours"
)
year_2.save!
puts "years created!"


puts "creating users..."

user_1 = User.create!(
  email: "laurin.alice@gmail.com",
  password: "Laurin88",
  pseudo: "Aliçounette"
)
user_1.save!

user_2 = User.create!(
  email: "laurin@gmail.com",
  password: "Laurin88",
  pseudo: "Miss Alice"
)
user_2.save!

user_3 = User.create!(
  email: "rapha@gmail.com",
  password: "Laurin88",
  pseudo: "Rapha"
)
user_3.save!
puts "users created!"


puts 'Creating misses...'

miss_1 = Miss.create!(
  first_name: "Luna",
  last_name: "Lacharme",
  region: "Bourgogne",
  age: "18 ans",
  height: "1m76",
  photo: "avatar1",
  year_id: year_2.id
)
miss_1.save!

miss_2 = Miss.create!(
  first_name: "Lola",
  last_name: "Turpin",
  region: "Aquitaine",
  age: "19 ans",
  height: "1m72",
  photo: "avatar1",
  year_id: year_2.id
)
miss_2.save!


miss_3 = Miss.create!(
  first_name: "Adeline",
  last_name: "Vetter",
  region: "Alsace",
  age: "27 ans",
  height: "1m81",
  photo: "avatar1",
  year_id: year_2.id
)
miss_3.save!

miss_4 = Miss.create!(
  first_name: "Oriane",
  last_name: "Mallet",
  region: "Auvergne",
  age: "22 ans",
  height: "1m73",
  photo: "avatar1",
  year_id: year_2.id
)
miss_4.save!

miss_5 = Miss.create!(
  first_name: "Noémie",
  last_name: "Le Bras",
  region: "Bretagne",
  age: "24 ans",
  height: "1m77",
  photo: "avatar1",
  year_id: year_2.id
)
miss_5.save!

miss_6 = Miss.create!(
  first_name: "Emmy",
  last_name: "Gisclon",
  region: "Centre-Val de Loire",
  age: "22 ans",
  height: "1m73",
  photo: "avatar1",
  year_id: year_2.id
)
miss_6.save!

miss_7 = Miss.create!(
  first_name: "Noa",
  last_name: "Dutitre",
  region: "Champagne-Ardenne",
  age: "21 ans",
  height: "1m70",
  photo: "avatar1",
  year_id: year_2.id
)
miss_7.save!

miss_8 = Miss.create!(
  first_name: "Sandra",
  last_name: "Bak",
  region: "Corse",
  age: "22 ans",
  height: "1m79",
  photo: "avatar1",
  year_id: year_2.id
)
miss_8.save!

miss_9 = Miss.create!(
  first_name: "Karla",
  last_name: "Bachir",
  region: "Côte d'Azur",
  age: "19 ans",
  height: "1m76",
  photo: "avatar1",
  year_id: year_2.id
)
miss_9.save!

miss_10 = Miss.create!(
  first_name: "Sonia",
  last_name: "Coutant",
  region: "Franche-Comté",
  age: "24 ans",
  height: "1m78",
  photo: "avatar1",
  year_id: year_2.id
)
miss_10.save!

miss_11 = Miss.create!(
  first_name: "Indira",
  last_name: "Ampiot",
  region: "Guadeloupe",
  age: "20 ans",
  height: "1m78",
  photo: "avatar1",
  year_id: year_1.id
)
miss_11.save!

puts "misses created!"


# file = File.open(Rails.root.join("app/assets/images/avatars/avatar1.png"))
# avatar_1.photo.attach(io: file, filename: "avatar1.png", content_type: "image/png")
# avatar_1.save!

# avatar_2 = Avatar.create!(
#   name: "nickname_2",
#   url: "avatar2",
#   user_id: user_2.id
# )
# file = File.open(Rails.root.join("app/assets/images/avatars/avatar2.png"))


# games
puts 'Creating groups...'

group_1 = Group.create!(
  name: "Le groupe des boloss",
  year_id: year_2.id
)
group_1.save!
puts "groups created!"

group_2 = Group.create!(
  name: "Le groupe des chtites miss",
  year_id: year_2.id
)
group_2.save!
puts "groups created!"

group_3 = Group.create!(
  name: "Le groupe des castor",
  year_id: year_1.id
)
group_3.save!
puts "groups created!"


puts 'Creating group_users...'

group_user_1 = GroupUser.create!(
  user_id: user_1.id,
  group_id: group_1.id
)
group_user_1.save!

group_user_2 = GroupUser.create!(
  user_id: user_2.id,
  group_id: group_1.id
)
group_user_2.save!
puts "group_users created!"

group_user_3 = GroupUser.create!(
  user_id: user_2.id,
  group_id: group_2.id
)
group_user_3.save!
puts "group_users created!"

group_user_4 = GroupUser.create!(
  user_id: user_2.id,
  group_id: group_3.id
)
group_user_4.save!
puts "group_users created!"

group_user_5 = GroupUser.create!(
  user_id: user_1.id,
  group_id: group_3.id
)
group_user_5.save!

group_user_6 = GroupUser.create!(
  user_id: user_3.id,
  group_id: group_3.id
)
group_user_6.save!
puts "group_users created!"



puts 'Creating real_winners...'
real_winner_1 = RealWinner.create!(
  year_id: year_1.id,
  miss_france: miss_11.region
)
puts "real_winners created!"

puts 'Creating score...'
score_1 = Score.create!(
  year_id: year_1.id,
  user_id: user_2.id,
  points: 120,
)
score_1.save!

score_2 = Score.create!(
  year_id: year_1.id,
  user_id: user_1.id,
  points: 160,
)
score_2.save!

score_3 = Score.create!(
  year_id: year_1.id,
  user_id: user_3.id,
  points: 20,
)
score_3.save!

score_4 = Score.create!(
  year_id: year_2.id,
  user_id: user_1.id,
  points: 20,
)
score_4.save!

score_5 = Score.create!(
  year_id: year_2.id,
  user_id: user_2.id,
  points: 120,
)
score_5.save!

score_6 = Score.create!(
  year_id: year_2.id,
  user_id: user_3.id,
  points: 420,
)
score_6.save!


puts "score created!"
