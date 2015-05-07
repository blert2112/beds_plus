
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
