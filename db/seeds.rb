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
Cook_2 = Cook.create!(user: Céline, last_name:"VINCENT", first_name: "Céline", age: "40", bio: "Over the top")

Dish_1 = Dish.create!(cook: Cook_1, name: "Poulet Roti", kind_of_dish: "Plat principal", speciality: "Terroir & Famille", description: "Poulet élevé en plein air, nourri avec une alimentation bio, rôti au four", veggie: "false", cooked: "true", be_reheated: "true", portion_size: "Moyenne (150-250g)", portion_count: "3")
Dish_2 = Dish.create!(cook: Cook_1, name: "Spaghetti bolognaise", kind_of_dish: "Plat principal", speciality: "Terroir & Famille", description: "Bolognaise maison sans viande, pleine de bons légumes", veggie: "true", cooked: "true", be_reheated: "true", portion_size: "Moyenne (150-250g)", portion_count: "1")
Dish_3 = Dish.create!(cook: Cook_2, name: "Tomates mozzarella", kind_of_dish: "Entrée", speciality: "Cuisines du monde", description: "Tomates du jardin bio, mozza burrata bio de Campanie", veggie: "true", cooked: "false", be_reheated: "false", portion_size: "Grande (>250g)", portion_count: "2")
