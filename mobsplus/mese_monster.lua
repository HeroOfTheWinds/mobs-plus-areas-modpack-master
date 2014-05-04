mobs:register_mob("mobsplus:mese_monster", {
	type = "monster",
	hp_max = 10,
	collisionbox = {-0.5, -1.5, -0.5, 0.5, 0.5, 0.5},
	visual = "mesh",
	mesh = "zmobs_mese_monster.x",
	textures = {"zmobs_mese_monster.png"},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 0.5,
	run_velocity = 2,
	damage = 3,
	drops = {
		{name = "default:mese",
		chance = 9,
		min = 1,
		max = 1,},
		{name = "default:mese_crystal",
		chance = 9,
		min = 1,
		max = 3,},
		{name = "default:mese_crystal_fragment",
		chance = 1,
		min = 1,
		max = 9,},
		{name = "mobsplus:egg_mese_monster",
		chance = 3,
		min = 1,
		max = 1,},
	},
	light_resistant = true,
	armor = 80,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	attack_type = "shoot",
	arrow = "mobsplus:mese_arrow",
	shoot_interval = .5,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	}
})
mobs:register_spawn("mobsplus:mese_monster", {"default:stone"}, 3, -1, 5000, 3, 0)
mobs:register_egg("mobsplus","mese_monster","Mese monster")

mobs:register_arrow("mobsplus:mese_arrow", {
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"default_mese_crystal_fragment.png"},
	velocity = 5,
	hit_player = function(self, player)
		local s = self.object:getpos()
		local p = player:getpos()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=1},
		}, vec)
	end,
	hit_node = function(self, pos, node)
	end
})