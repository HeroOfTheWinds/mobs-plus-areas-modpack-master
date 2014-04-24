minetest.register_craftitem("mobmeat:chickenmeat", {
description = "Chicken Meat",
	inventory_image = "chicken_meat.png",
})
minetest.register_craftitem("mobmeat:friedchicken", {
description = "Fried Chicken",
	inventory_image = "fried_chicken.png",
	on_use = minetest.item_eat(6),
})
minetest.register_craftitem("mobmeat:beef", {
description = "Beef",
	inventory_image = "beef.png",
})
minetest.register_craftitem("mobmeat:steak", {
description = "Steak",
	inventory_image = "steak.png",
	on_use = minetest.item_eat(8),
})
minetest.register_craftitem("mobmeat:lambmeat", {
description = "Lamb Meat",
	inventory_image = "lamb_meat.png",
})
minetest.register_craftitem("mobmeat:roastlamb", {
description = "Roasted Lamb Quarter",
	inventory_image = "roast_lamb.png",
	on_use = minetest.item_eat(6),
})
minetest.register_craftitem("mobmeat:horsemeat", {
description = "Horse Meat",
	inventory_image = "horse_meat.png",
})
minetest.register_craftitem("mobmeat:horserib", {
description = "Roasted Horserib",
	inventory_image = "horserib.png",
	on_use = minetest.item_eat(9),
})
minetest.register_craftitem("mobmeat:boarmeat", {
description = "Boar Meat",
	inventory_image = "boar_meat.png",
})
minetest.register_craftitem("mobmeat:roastpork", {
description = "Roasted Boar",
	inventory_image = "roastpig.png",
	on_use = minetest.item_eat(9),
})


minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobmeat:chickenmeat",
	output = "mobmeat:friedchicken",
})
minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobmeat:beef",
	output = "mobmeat:steak",
})
minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobmeat:lambmeat",
	output = "mobmeat:roastlamb",
})
minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobmeat:horsemeat",
	output = "mobmeat:horserib",
})
minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobmeat:boarmeat",
	output = "mobmeat:roastpork",
})