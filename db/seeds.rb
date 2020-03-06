User.destroy_all
Beer.destroy_all
BeerList.destroy_all


puts "Creating User"

user1 = User.create(name: "clarence")
user2 = User.create(name: "leo")
user3 = User.create(name: "von")
user4 = User.create(name: "leroy")

puts "User Created"


puts "Creating Beer"

beer1 = Beer.create(name: "Bud Light", brewer: "Anheuser Busch", abv: 5.0)
beer2 = Beer.create(name: "Corona", brewer: "Grupo Modelo", abv: 4.5)
beer3 = Beer.create(name: "SweetWater 420", brewer: "SweetWater Brewing Company", abv: 5.3)
beer4 = Beer.create(name: "90 Minute IPA", brewer: "Dogfish Head", abv: 5.0)

puts "Beer created"


puts "Creating Beerlist"

list1 = BeerList.create(user_id: user1.id, beer_id: beer1.id, rating: 6)
list2 = BeerList.create(user_id: user2.id, beer_id: beer2.id, rating: 8)
list3 = BeerList.create(user_id: user3.id, beer_id: beer3.id, rating: 5)
list4 = BeerList.create(user_id: user4.id, beer_id: beer4.id, rating: 8)

puts "Beerlist Created"
