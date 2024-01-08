--data_overrides.lua



-- slag definitions
local slag = table.deepcopy(data.raw["item"]["stone"])
slag.name = "slag"
slag.stack_size = slag.stack_size * 2
local slag_tint = {r=0.75, g=0.75, b=0.75, a=1} -- darken
slag.icons = {
  {
    icon = "__toms-byproducts__/graphics/icons/slag.png",
    icon_size = slag.icon_size,
    tint = slag_tint
  },
}
slag.pictures =
{
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag.png",   scale = 0.25, mipmap_count = 4   , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-1.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-2.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-3.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-4.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-5.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-6.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-7.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-8.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-9.png",   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-10.png",   scale = 0.25, mipmap_count = 4, tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-11.png",   scale = 0.25, mipmap_count = 4, tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-12.png",   scale = 0.25, mipmap_count = 4, tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-13.png",   scale = 0.25, mipmap_count = 4, tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-14.png",   scale = 0.25, mipmap_count = 4, tint = slag_tint},
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag-15.png",   scale = 0.25, mipmap_count = 4, tint = slag_tint},

}
data:extend{slag}

-- modify iron plate recipe
data.raw["recipe"]["iron-plate"].result_count = 2
data.raw["recipe"]["iron-plate"].results = {
  {type="item", name="slag", amount=1},
  {type="item", name="iron-plate", amount=1}
}
data.raw["recipe"]["iron-plate"].main_product = "iron-plate" -- makes the icon etc for iron plate, because slag is a byproduct. 

-- modify copper plate recipe
data.raw["recipe"]["copper-plate"].result_count = 2
data.raw["recipe"]["copper-plate"].results = {
  {type="item", name="slag", amount=1},
  {type="item", name="copper-plate", amount=1}
}
data.raw["recipe"]["copper-plate"].main_product = "copper-plate"

-- steel slag modifications
data.raw["recipe"]["steel-plate"].result_count = 2
data.raw["recipe"]["steel-plate"].normal.result= ""
data.raw["recipe"]["steel-plate"].normal.results= {{type="item", name="slag", amount = 1, probability = 0.25},{type="item", name="steel-plate", amount = 1}}
data.raw["recipe"]["steel-plate"].expensive.result= ""
data.raw["recipe"]["steel-plate"].expensive.results= {{type="item", name="slag", amount = 1, probability = 0.25},{type="item", name="steel-plate", amount = 1}}
data.raw["recipe"]["steel-plate"].main_product = "steel-plate"
data.raw["recipe"]["steel-plate"].icon = "__base__/graphics/icons/steel-plate.png"
data.raw["recipe"]["steel-plate"].subgroup = "raw-material"
data.raw["recipe"]["steel-plate"].icon_size = 64
data.raw["recipe"]["steel-plate"].icon_mipmaps = 4

-- modify uranium processing recipe
data.raw["recipe"]["uranium-processing"].result_count = 3
table.insert(data.raw["recipe"]["uranium-processing"].results, 0, {type="item", name="slag", amount = 3})





-- increase furnace inventory to make room for slag
data.raw["furnace"]["stone-furnace"].result_inventory_size = 2
data.raw["furnace"]["steel-furnace"].result_inventory_size = 2
data.raw["furnace"]["electric-furnace"].result_inventory_size = 2


-- turning slag into bricks
local slag_bricks_recipe = {{
  type = "recipe",
  name = "slag-smelting",
  category = "smelting",
  enabled = true,
  energy_required = 5.0,
  ingredients = {{"slag", 5}},
  result = "stone-brick"
}}
data:extend(slag_bricks_recipe)

-- add a new recipe category to prevent hand crafting of refining
data:extend({{
  type = "recipe-category",
  name = "byproduct-refining"
}})

-- add byproduct refining to all assembling machines
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "byproduct-refining")
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "byproduct-refining")
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "byproduct-refining")

local slag_trace_extraction = {{
  type = "recipe",
  name = "slag-trace-extraction",
  category = "byproduct-refining",
  enabled = true,
  energy_required = 10,
  ingredients = {{"slag", 10}},
  icon = "__toms-byproducts__/graphics/icons/slag.png",
  icon_size = 64, icon_mipmaps = 5,
  subgroup = "raw-material",
  results = {
    {
      name = "iron-ore",
      probability = 0.3,
      amount = 1
    },
    {
      name = "copper-ore",
      probability = 0.3,
      amount = 1
    },
    {
      name = "stone",
      probability = 0.5,
      amount = 1
    },
    {
      name = "uranium-ore",
      probability = 0.01,
      amount = 1
    },
    {
      name = "coal",
      probability = 0.3,
      amount = 1
    },
    {
      name = "sulfur",
      probability = 0.1,
      amount = 1
    },
  }
}}

data:extend(slag_trace_extraction)


