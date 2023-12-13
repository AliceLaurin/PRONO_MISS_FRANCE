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
Group.destroy_all
User.destroy_all
Miss.destroy_all
Year.destroy_all


puts "creating years..."
year_1 = Year.create!(
  year: "2024",
  date: "Wed, 13 Dec 2023 13:47:58.455031000 UTC +00:00"
)
year_1.save!

year_2 = Year.create!(
  year: "2025",
  date: "Wed, 18 Dec 2024 13:47:58.455031000 UTC +00:00"
)
year_2.save!

puts "creating users..."

user_1 = User.create!(
  email: "laurin.alice@gmail.com",
  password: "Laurin88"
)
user_1.save!

user_2 = User.create!(
  email: "laurin@gmail.com",
  password: "Laurin88"
)
user_2.save!

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
  user_id: user_1.id,
  user_id: user_2.id,
  year_id: year_2.id
)
group_1.save!
