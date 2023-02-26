# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Clément = User.create!(first_name: "Clément", email: "clemdelatang@gmail.com", password: "testtest")
Céline = User.create!(first_name: "Céline", email: "clemdelatang@gmail.com", password: "testtest")
Pierre = User.create!(first_name: "Pierre", email: "clemdelatang@gmail.com", password: "testtest")
Paul = User.create!(first_name: "Jean-Paul", email: "clemdelatang@gmail.com", password: "testtest")
Jacques = User.create!(first_name: "Jean-Paul", email: "tanguyclement@sfr.fr", password: "testtest")
David = User.create!(first_name: "David", email: "tanguyclement@sfr.fr", password: "testtest")
Gaspard = User.create!(first_name: "Gaspard", email: "tanguyclement@sfr.fr", password: "testtest")

Cook.delete_all
Cook_1 = Cook.create!(user: Clément, age: "46", bio: "Bon réchauffeur, devenu cordon bleu improvisateur")
Cook_2 = Cook.create!(user: Céline, age: "46", bio: "Autodidacte, j'ai appris à cuisine au fil de mes envies et pour faire plaisir. Chaque jour, je cuisine et emmène une part au travail. J'aimerais vous faire partager ma passion")
Cook_3 = Cook.create!(user: Pierre, age: "75", bio: "Encyclopédie de la cuisine romantique")
Cook_4 = Cook.create!(user: Paul, age: "53", bio: "Génie de la mise en scène culinaire")
Cook_5 = Cook.create!(user: Jacques, age: "38", bio: "Cynique des fourneaux")
Cook_6 = Cook.create!(user: David, age: "20", bio: "")
Cook_7 = Cook.create!(user: Gaspard, age: "19", bio: "")

Cart.delete_all

Order.delete_all

Dish.delete_all
Dish.create!(cook: Cook_1, name: "Poulet Roti", kind_of_dish: "Plat principal", speciality: "Terroir & Famille", description: "Poulet élevé en plein air, nourri avec une alimentation bio, rôti au four", veggie: "false", gluten_free: "false", halal: "false", kosher: "false", cooked: "true", be_reheated: "true", portion_size: "Moyenne (200-300g)", portion_count: "3", price: '8.50', exp_date: "06/06/2023 20:30:00", collect_date: "07/06/2023 12:00:00")
Dish.create!(cook: Cook_1, name: "Spaghetti bolognaise", kind_of_dish: "Plat principal", speciality: "Terroir & Famille", description: "Bolognaise maison sans viande, pleine de bons légumes", veggie: "true", gluten_free: "false", halal: "false", kosher: "false", cooked: "true", be_reheated: "true", portion_size: "Moyenne (200-300g)", portion_count: "1", price: '6.00', exp_date: "11/06/2023 20:30:00", collect_date: "12/06/2023 12:00:00")
Dish.create!(cook: Cook_2, name: "Tajine au poulet", kind_of_dish: "Plat principal", speciality: "Cuisines du monde", description: "C'est bon comme là-bas, dis !", veggie: "false", gluten_free: "false", halal: "true", kosher: "false", cooked: "true", be_reheated: "true", portion_size: "Grande (>300g)", portion_count: "2", price: '5.00', exp_date: "06/05/2023 20:30:00", collect_date: "07/05/2023 12:00:00")
Dish.create!(cook: Cook_2, name: "Mafé", kind_of_dish: "Plat principal", speciality: "Cuisines du monde", description: "Plat sénégalais à tomber", veggie: "false", gluten_free: "false", halal: "false", kosher: "false", cooked: "true", be_reheated: "true", portion_size: "Grande (>300g)", portion_count: "2", price: '5.00', exp_date: "06/05/2023 20:30:00", collect_date: "07/05/2023 12:00:00")
Dish.create!(cook: Cook_2, name: "Riz cantonnais", kind_of_dish: "Plat principal", speciality: "Cuisines du monde", description: "Jambon, oeufs, petits pois", veggie: "false", gluten_free: "false", halal: "false", kosher: "false", cooked: "true", be_reheated: "true", portion_size: "Grande (>300g)", portion_count: "2", price: '5.00', exp_date: "06/05/2023 20:30:00", collect_date: "07/05/2023 12:00:00")
Dish.create!(cook: Cook_3, name: "Tomates mozzarella", kind_of_dish: "Entrée", speciality: "Cuisines du monde", description: "Tomates du jardin bio, mozza burrata bio de Campanie", veggie: "true", gluten_free: "false", halal: "false", kosher: "false", cooked: "false", be_reheated: "false", portion_size: "Grande (>300g)", portion_count: "2", price: '5.00', exp_date: "06/05/2023 20:30:00", collect_date: "07/05/2023 12:00:00")
Dish.create!(cook: Cook_4, name: "Filet de boeuf en croûte", kind_of_dish: "Plat principal", speciality: "Gastronomique", description: "Viande tendre et moelleuse de chez Desnoyer dans une pâte maison délicatement feuilletée", veggie: "false", gluten_free: "false", halal: "false", kosher: "false", cooked: "true", be_reheated: "false", portion_size: "Petite (env. 150g)", portion_count: "4", price: '9.00', exp_date: "10/07/2023 22:30:00", collect_date: "12/07/2023 12:30:00")
Dish.create!(cook: Cook_5, name: "Poire Belle Hélène", kind_of_dish: "Dessert & Patisserie", speciality: "Terroir & Famille", description: "C'est le bonheur", veggie: "true", gluten_free: "false", halal: "false", kosher: "false", cooked: "false", be_reheated: "false", portion_size: "Petite (env. 150g)", portion_count: "6", price: '4.50', exp_date: "05/05/2023 20:00:00", collect_date: "07/05/2023 13:00:00")
Dish.create!(cook: Cook_6, name: "Tarte aux fraises", kind_of_dish: "Dessert & Patisserie", speciality: "Terroir & Famille", description: "Fraises du jardin, pâte maison", veggie: "true", gluten_free: "true", halal: "false", kosher: "false", cooked: "false", be_reheated: "false", portion_size: "Petite (env. 150g)", portion_count: "6", price: '4.50', exp_date: "05/05/2023 20:00:00", collect_date: "07/05/2023 13:00:00")
Dish.create!(cook: Cook_7, name: "Gateau à l'ananas", kind_of_dish: "Dessert & Patisserie", speciality: "Terroir & Famille", description: "Recette de l'Ile de la Réunion", veggie: "true", gluten_free: "false", halal: "false", kosher: "false", cooked: "false", be_reheated: "false", portion_size: "Petite (env. 150g)", portion_count: "6", price: '4.50', exp_date: "05/05/2023 20:00:00", collect_date: "07/05/2023 13:00:00")


Place.delete_all
Place.create!(full_address: "3 avenue Lacour", zip_code: "06110", city: "Le Cannet", kind_of_place: "Domicile", active: "true")
Place.create!(full_address: "28 chemin des Moulières", zip_code: "06110", city: "Le Cannet", kind_of_place: "Domicile", active: "true")
Place.create!(full_address: "8 avenue du général Leclerc", zip_code: "83990", city: "Saint-Tropez", kind_of_place: "Bureaux/Agence", active: "true")
Place.create!(full_address: "243 rue Saint-Honoré", zip_code: "75001", city: "Paris", kind_of_place: "Commerce/Restaurant", active: "true")
Place.create!(full_address: "5 rue Lavoisier", zip_code: "75008", city: "Paris", kind_of_place: "Domicile", active: "true")
Place.create!(full_address: "2 rue Bachaumont", zip_code: "75002", city: "Paris", kind_of_place: "Bureaux/Agence", active: "true")
Place.create!(full_address: "5 rue Dupin", zip_code: "75006", city: "Paris", kind_of_place: "Domicile", active: "true")

Speciality.delete_all
Speciality.create!(name: "Terroir & Famille", level: "Top Chef")
Speciality.create!(name: "Gastronomique", level: "Avancé")
Speciality.create!(name: "Terroir & Famille", level: "Avancé")
Speciality.create!(name: "Cuisines du monde", level: "Avancé")
Speciality.create!(name: "Bio & Diététique", level: "Top Chef")
Speciality.create!(name: "Bio & Diététique", level: "Amateur")
Speciality.create!(name: "Bio & Diététique", level: "Avancé")

CookPlace.delete_all
CookPlace.create!(cook_id: "1", place_id: "1")
CookPlace.create!(cook_id: "2", place_id: "2")
CookPlace.create!(cook_id: "3", place_id: "3")
CookPlace.create!(cook_id: "4", place_id: "4")
CookPlace.create!(cook_id: "5", place_id: "5")
CookPlace.create!(cook_id: "6", place_id: "6")
CookPlace.create!(cook_id: "7", place_id: "7")

CookSpeciality.delete_all
CookSpeciality.create!(cook_id: "1", speciality_id: "1")
CookSpeciality.create!(cook_id: "2", speciality_id: "2")
CookSpeciality.create!(cook_id: "3", speciality_id: "3")
CookSpeciality.create!(cook_id: "4", speciality_id: "4")
CookSpeciality.create!(cook_id: "5", speciality_id: "5")
CookSpeciality.create!(cook_id: "6", speciality_id: "6")
CookSpeciality.create!(cook_id: "7", speciality_id: "7")



