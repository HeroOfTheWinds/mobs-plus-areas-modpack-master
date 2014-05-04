--comment out any of these lines to disable that particular mob
--peaceful mobs:
dofile(minetest.get_modpath("mobsplus").."/api.lua")
dofile(minetest.get_modpath("mobsplus").."/cow.lua")
dofile(minetest.get_modpath("mobsplus").."/sheep.lua")
dofile(minetest.get_modpath("mobsplus").."/chicken.lua")
dofile(minetest.get_modpath("mobsplus").."/boar.lua")
dofile(minetest.get_modpath("mobsplus").."/horse.lua")
dofile(minetest.get_modpath("mobsplus").."/rat.lua")
--hostile mobs:
dofile(minetest.get_modpath("mobsplus").."/wolf.lua")
dofile(minetest.get_modpath("mobsplus").."/dirt_monster.lua")
dofile(minetest.get_modpath("mobsplus").."/sand_monster.lua")
dofile(minetest.get_modpath("mobsplus").."/stone_monster.lua")
dofile(minetest.get_modpath("mobsplus").."/tree_monster.lua")
dofile(minetest.get_modpath("mobsplus").."/oerkki.lua")
dofile(minetest.get_modpath("mobsplus").."/dungeon_master.lua")
dofile(minetest.get_modpath("mobsplus").."/mese_monster.lua")


-- Bucket of milk
minetest.register_node("mobsplus:bucket_milk", 
	{
		description = "Milk bucket",
		inventory_image  = "jkanimals_bucket_milk.png",
		tiles = {"jkanimals_bucket_milk.png"},
		drawtype = "plantlike",
		--sunlight_propagates = false,
		--use_texture_alpha = true,
		--paramtype = "light",
		groups = {snappy=3},		
		
		on_place = function(itemstack, placer, pointed_thing)
			return
		end
})

--these are currently unused... I think
minetest.register_craftitem("mobsplus:meat_raw", {
	description = "Raw Meat",
	inventory_image = "mobs_meat_raw.png",
})

minetest.register_craftitem("mobsplus:meat", {
	description = "Meat",
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobsplus:meat",
	recipe = "mobsplus:meat_raw",
	cooktime = 5,
})

if minetest.setting_get("log_mods") then
	minetest.log("action", "mobs loaded")
end
