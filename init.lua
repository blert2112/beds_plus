
local a_wood = ""

local bedcolors = {
	{"black", "black"},
	{"blue", "blue"},
	{"brown", "brown" },
	{"cyan", "cyan" },
	{"dark_green", "dark_green"},
	{"dark_grey", "dark_grey"},
	{"green", "green"},
	{"grey", "grey"},
	{"magenta", "magenta"},
	{"orange", "orange" },
	{"pink", "pink"},
	{"violet", "violet"},
	{"white", "white"},
	{"yellow", "yellow"}
}
local color = {}
local woolcolor = {}

-- fancy shaped bed
a_wood = "default_wood.png"

for c in ipairs(bedcolors) do
	color = bedcolors[c][1]
	woolcolor = bedcolors[c][2]
	beds.register_bed("beds_plus:fancy_bed_"..color, {
		description = "Fancy Bed ("..color..")",
		inventory_image = "beds_fancy_"..color..".png",
		wield_image = "beds_fancy_"..color..".png",
		tiles = {"fancy_bed_"..color..".png", a_wood},
		mesh = "fancy_bed.obj",
		selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.1875, 1.5},
		collisionbox = {-0.5, -0.5, -0.5, 0.5, -0.06, 1.5},
		recipe = {
			{"", "", "group:stick"},
			{"wool:"..woolcolor, "wool:"..woolcolor, "wool:white"},
			{"group:wood", "group:wood", "group:wood"},
		}
	})
	beds.register_bed("beds_plus:bed_"..color, {
		description = "Simple Bed ("..color..")",
		inventory_image = "beds_bed_"..color..".png",
		wield_image = "beds_bed_"..color..".png",
		tiles = {"simple_bed_"..color..".png", a_wood},
		mesh = "simple_bed.obj",
		selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
		collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
		recipe = {
			{"", "", ""},
			{"wool:"..woolcolor, "wool:"..woolcolor, "wool:white"},
			{"group:wood", "group:wood", "group:wood"},
		}
	})
end

-- Beds mod overides
minetest.override_item("beds:fancy_bed", {
	description = "Fancy Bed (red)",
})
minetest.override_item("beds:bed", {
	description = "Simple Bed (red)"
})

-- specials
beds.register_bed("beds_plus:bed_purple_swirl", {
	description = "Fancy Bed (Purple Swirl)",
	inventory_image = "beds_fancy_purple_swirl.png",
	wield_image = "beds_fancy_purple_swirl.png",
	tiles = {"fancy_bed_purple_swirl.png", a_wood},
	mesh = "fancy_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.1875, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, -0.06, 1.5},
	recipe = {
		{"", "", "group:stick"},
		{"wool:violet", "wool:pink", "wool:white"},
		{"group:wood", "group:wood", "group:wood"},
	}
})
beds.register_bed("beds_plus:bed_deep_sea", {
	description = "Fancy Bed (Deep Sea)",
	inventory_image = "beds_fancy_deep_sea.png",
	wield_image = "beds_fancy_deep_sea.png",
	tiles = {"fancy_bed_deep_sea.png", a_wood},
	mesh = "fancy_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.1875, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, -0.06, 1.5},
	recipe = {
		{"", "", "group:stick"},
		{"wool:blue", "wool:cyan", "wool:white"},
		{"group:wood", "group:wood", "group:wood"},
	}
})
beds.register_bed("beds_plus:bed_nyan", {
	description = "Fancy Bed (Nyan Cat)",
	inventory_image = "beds_fancy_nyan.png",
	wield_image = "beds_fancy_nyan.png",
	tiles = {"fancy_bed_nyan.png", a_wood},
	mesh = "fancy_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.1875, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, -0.06, 1.5},
	recipe = {
		{"", "", "group:stick"},
		{"default:nyancat", "wool:pink", "wool:white"},
		{"group:wood", "group:wood", "group:wood"},
	}
})
beds.register_bed("beds_plus:bed_oerkki", {
	description = "Fancy Bed (Oerkki)",
	inventory_image = "beds_fancy_oerkki.png",
	wield_image = "beds_fancy_oerkki.png",
	tiles = {"fancy_bed_oerkki.png", a_wood},
	mesh = "fancy_bed.obj",
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.1875, 1.5},
	collisionbox = {-0.5, -0.5, -0.5, 0.5, -0.06, 1.5},
	recipe = {
		{"", "", "group:stick"},
		{"default:obsidian", "wool:black", "wool:white"},
		{"group:wood", "group:wood", "group:wood"},
	}
})

-- if Homedecor is enabled, make sleepable and set craft
if minetest.get_modpath("homedecor") then
	bedcolors = {
		{"red", "red"},
		{"orange", "orange" },
		{"yellow", "yellow"},
		{"green", "dark_green"},
		{"blue", "blue"},
		{"violet", "violet"},
		{"pink", "pink"},
		{"darkgrey", "dark_grey"},
		{"brown", "brown" }
	}
	for c in ipairs(bedcolors) do
		color = bedcolors[c][1]
		woolcolor = bedcolors[c][2]
		minetest.override_item("homedecor:bed_"..color.."_regular", {
			on_rightclick = function(pos, node, clicker)
				beds.on_rightclick(pos, clicker)
			end,
			after_place_node = function(pos, placer, itemstack)
				local n = minetest.get_node_or_nil(pos)
				if not n or not n.param2 then
					minetest.remove_node(pos)
					return true
				end
				local dir = minetest.facedir_to_dir(n.param2)
				local p = {x=pos.x+dir.x,y=pos.y,z=pos.z+dir.z}
				local n2 = minetest.get_node_or_nil(p)
				local def = minetest.registered_items[n2.name] or nil
				if not n2 or not def or not def.buildable_to then
					minetest.remove_node(pos)
					minetest.chat_send_player(placer:get_player_name(), "No room to place the bed!")
					return true
				end
				minetest.set_node(pos, {name = n.name, param2 = n.param2})
				return false
			end,
			recipe = {
				{"group:stick", "", "group:stick"},
				{"wool:"..woolcolor, "wool:"..woolcolor, "wool:white"},
				{"group:wood", "", "group:wood"},
			}
		})
		minetest.register_craft({
			    output = "homedecor:bed_"..color.."_regular",
			    recipe = {
				{"group:stick", "", "group:stick"},
				{"wool:"..woolcolor, "wool:"..woolcolor, "wool:white"},
				{"group:wood", "", "group:wood"},
			    }
		})
		minetest.override_item("homedecor:bed_"..color.."_extended", {
			on_rightclick = function(pos, node, clicker)
				beds.on_rightclick(pos, clicker)
			end
		})
	end
end







