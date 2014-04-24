
-- Returns a list of areas that include the provided position
function areas:getAreasAtPos(pos)
	local a = {}
	local px, py, pz = pos.x, pos.y, pos.z
	for id, area in pairs(self.areas) do
		local ap1, ap2 = area.pos1, area.pos2
		if px >= ap1.x and px <= ap2.x and
		   py >= ap1.y and py <= ap2.y and
		   pz >= ap1.z and pz <= ap2.z then
			a[id] = area
		end
	end
	return a
end

-- Checks if the area is unprotected or owned by you
function areas:canInteract(pos, name)
	if minetest.check_player_privs(name, {areas=true}) then
		return true
	end
	local owned = false
	for _, area in pairs(self:getAreasAtPos(pos)) do
		if area.owner == name or area.open then
			return true
		else
			owned = true
		end
	end
	return not owned
end

-- Returns a table (list) of all players that own an area
function areas:getNodeOwners(pos)
	local owners = {}
	for _, area in pairs(self:getAreasAtPos(pos)) do
		table.insert(owners, area.owner)
	end
	return owners
end

--for mobsplus
--function to check what mobs are allowed to spawn in a given area
function areas:getAllowedMobs(pos)
	local noMobData = false
	local peaceMobs = false
	local hostileMobs = false
	local allMobs = false
	for _, area in pairs(self:getAreasAtPos(pos)) do
		--If area.mob is not assigned, and no other areas exist, treat it as disallowed.
		if not area.mob then
			noMobData = true
		--see if no mobs are allowed in given area; if so, break.
		elseif area.mob == "none" then
			return "none"
		--so far there's a chance, so check what is allowed
		elseif area.mob == "peaceful" then
			peaceMobs = true
		elseif area.mob == "hostile" then
			hostileMobs = true
		elseif area.mob == "all" then
			allMobs = true
		end
	end
	--all areas agree that only peaceful mobs
	if peaceMobs and not hostileMobs and not allMobs then
		return "peaceful"
	--all areas agree that only hostile mobs
	elseif hostileMobs and not peaceMobs and not allMobs then
		return "hostile"
	--some areas say one, others another, so treat as both
	elseif hostileMobs and peaceMobs then
		return "all"
	--all areas agree to allow all mobs
	elseif allMobs then
		return "all"
	elseif noMobData then
		return "all"
	else
		--there are no mob settings for the current area
		--treat it as if not allowed
		return "none"
	end
end

--function to retrieve the chance of spawning in an area
function areas:getSpawnChance(pos)
	local chnce = 7000
	for _, area in pairs(self:getAreasAtPos(pos)) do
		chnce = area.chance
	end
	return chnce
end