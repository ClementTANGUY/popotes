# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Clem = User.create!(email: "clemdelatang@gmail.com", password: "testtest")
Céline = User.create!(email: "celin.vincent@yahoo.fr", password: "testtest")

Cook_1 = Cook.create!(user: Clem, last_name:"TANGUY", first_name: "Clément", age: "40", bio: "Top chef")
Cook_2 = Cook.create!(user: Céline, last_name:"VINCENT", first_name: "Céline", age: "40", bio: "Autodidacte, j'ai appris à cuisine au fil de mes envies et pour faire plaisir. Chaque jour, je cuisine et emmène une part au travail. J'aimerais vous faire partager ma passion")

Dish_1 = Dish.create!(cook: Cook_1, name: "Poulet Roti", kind_of_dish: "Plat principal", speciality: "Terroir & Famille", description: "Poulet élevé en plein air, nourri avec une alimentation bio, rôti au four", veggie: "false", cooked: "true", be_reheated: "true", portion_size: "Moyenne (150-250g)", portion_count: "3")
Dish_2 = Dish.create!(cook: Cook_1, name: "Spaghetti bolognaise", kind_of_dish: "Plat principal", speciality: "Terroir & Famille", description: "Bolognaise maison sans viande, pleine de bons légumes", veggie: "true", cooked: "true", be_reheated: "true", portion_size: "Moyenne (150-250g)", portion_count: "1")
Dish_3 = Dish.create!(cook: Cook_2, name: "Tomates mozzarella", kind_of_dish: "Entrée", speciality: "Cuisines du monde", description: "Tomates du jardin bio, mozza burrata bio de Campanie", veggie: "true", cooked: "false", be_reheated: "false", portion_size: "Grande (>300g)", portion_count: "2")
Dish_4 = Dish.create!(cook: Cook_2, name: "Filet de boeuf en croûte", kind_of_dish: "Plat principal", speciality: "Gastronomique", description: "Viande tendre et moelleuse de chez Desnoyer dans une pâte maison délicatement feuilletée", veggie: "false", cooked: "true", be_reheated: "false", portion_size: "Petite (env. 100g)", portion_count: "4")
Dish_5 = Dish.create!(cook: Cook_2, name: "Moelleux au chocolat", kind_of_dish: "Dessert & Patisserie", speciality: "Gastronomique", description: "Moelleux au coeur fondant, cacao bio équitable de Madagascar", veggie: "true", cooked: "true", be_reheated: "true", portion_size: "Petite (env. 100g)", portion_count: "6")

Speciality_1 = Speciality.create!(name: "Gastronomique", level: "Top Chef")
Speciality_2 = Speciality.create!(name: "Gastronomique", level: "Avancé")
Speciality_3 = Speciality.create!(name: "Gastronomique", level: "Amateur")
Speciality_4 = Speciality.create!(name: "Gastronomique", level: "Débutant")

Speciality_5 = Speciality.create!(name: "Terroir & Famille", level: "Top Chef")
Speciality_6 = Speciality.create!(name: "Terroir & Famille", level: "Avancé")
Speciality_7 = Speciality.create!(name: "Terroir & Famille", level: "Amateur")
Speciality_8 = Speciality.create!(name: "Terroir & Famille", level: "Débutant")

Speciality_9 = Speciality.create!(name: "Cuisines du monde", level: "Top Chef")
Speciality_10 = Speciality.create!(name: "Cuisines du monde", level: "Avancé")
Speciality_11 = Speciality.create!(name: "Cuisines du monde", level: "Amateur")
Speciality_12 = Speciality.create!(name: "Cuisines du monde", level: "Débutant")

Speciality_13 = Speciality.create!(name: "Bio & Diététique", level: "Top Chef")
Speciality_14 = Speciality.create!(name: "Bio & Diététique", level: "Avancé")
Speciality_15 = Speciality.create!(name: "Bio & Diététique", level: "Amateur")
Speciality_16 = Speciality.create!(name: "Bio & Diététique", level: "Débutant")


