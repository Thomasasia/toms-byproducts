--data_overrides.lua




-- function to add product to recipe intelligently.
-- adds the byproducts instead of overwriting, to allow for mod support!
-- byproducts is a table


-- slag definitions
local slag = table.deepcopy(data.raw["item"]["stone"])
slag.name = "tbp-slag"
slag.stack_size = slag.stack_size * 2
local slag_tint = {r=0.75, g=0.75, b=0.75, a=1} -- darken
slag.order = "z[tbp-slag]"
slag.subgroup = "intermediate-product"
slag.icons = {
  {
    icon = "__toms-byproducts__/graphics/icons/slag.png",
    icon_size = slag.icon_size,
    tint = slag_tint
  },
}
slag.pictures =
{
  { size = 64, filename = "__toms-byproducts__/graphics/icons/slag.png"  ,   scale = 0.25, mipmap_count = 4 , tint = slag_tint},
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











-- turning slag into bricks
local slag_bricks_recipe = {{
  type = "recipe",
  name = "tbp-slag-smelting",
  category = "smelting",
  enabled = true,
  energy_required = 5.0,
  ingredients = {{"tbp-slag", 5}},
  result = "stone-brick"
}}
data:extend(slag_bricks_recipe)

-- add a new recipe category to prevent hand crafting of refining
data:extend({{
  type = "recipe-category",
  name = "tbp-byptoduct-refining"
}})

-- add byproduct refining to all assembling machines
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "tbp-byptoduct-refining")
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "tbp-byptoduct-refining")
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "tbp-byptoduct-refining")

local slag_trace_extraction = {{
  type = "recipe",
  name = "tbp-slag-trace-extraction",
  category = "tbp-byptoduct-refining",
  enabled = true,
  energy_required = 10,
  ingredients = {{"tbp-slag", 10}},
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
-- spent etchant
local spent_etchant = {{
  type = "item",
  name = "tbp-spent-etchant",
  icon = "__toms-byproducts__/graphics/icons/spent-etchant.png",
  icon_size = 64, icon_mipmaps = 4,
  order = "z[tbp-spent-etchant]",
  subgroup = "intermediate-product",
  stack_size = 100
}}
data:extend(spent_etchant)

-- metal extraction from spent etchant
local spent_etchant_to_copper = {{
  type = "recipe",
  name = "tbp-etchant-metal-reclamation",
  category = "tbp-byptoduct-refining",
  enabled = true,
  energy_required = 6,
  ingredients = {{"tbp-spent-etchant", 10}},
  result = "copper-plate"
}}
data:extend(spent_etchant_to_copper)

local spent_etchant_to_copper_adv = {{
  type = "recipe",
  name = "tbp-etchant-advanced-metal-reclamation",
  category = "tbp-byptoduct-refining",
  enabled = true,
  energy_required = 3,
  ingredients = {{"tbp-spent-etchant", 5}},
  result = "copper-cable"
}}
data:extend(spent_etchant_to_copper_adv)

-- plastic waste
local plastic_waste = {{
  type = "item",
  name = "tbp-plastic-waste",
  icon = "__toms-byproducts__/graphics/icons/plastic-waste.png",
  icon_size = 64, icon_mipmaps = 4,
  order = "z[tbp-plastic-waste]",
  subgroup = "intermediate-product",
  stack_size = 100
  
}}
data:extend(plastic_waste)

-- solid pyrolysis oil
local solid_pyrolysis_oil = {{
  type = "item",
  name = "tbp-solid-pyrolysis-oil",
  icon = "__toms-byproducts__/graphics/icons/solid-pyrolysis-oil.png",
  icon_size = 64, icon_mipmaps = 4,
  fuel_category = "chemical",
  fuel_value = "15MJ",
  fuel_acceleration_multiplier = 1.2,
  fuel_top_speed_multiplier = 1.05,
  subgroup = "raw-material",
  order = "c[solid-pyrolysis-oil]",
  fuel_emissions_multiplier = 1.25,
  stack_size = 50
}
}
data:extend(solid_pyrolysis_oil)

-- liquid pyrolysis oil added here for barreling
local liquid_pyrolysis_oil ={{
  type = "fluid",
  name = "tbp-liquid-pyrolysis-oil",
  default_temperature = 25,
  heat_capacity = "0.1KJ",
  base_color = {r=0.8,g=0.8,b=0.8},
  flow_color = {r=0.8,g=0.8,b=0.8},
  icon = "__toms-byproducts__/graphics/icons/liquid-pyrolysis-oil.png",
  icon_size = 64, icon_mipmaps = 4,
  order = "a[fluid]-z[tbp-liquid_pyrolysis_oil]",
  auto_barrel = true
}}
data:extend(liquid_pyrolysis_oil)



-- convert plastic to liquid pyrolysis oil
local plastic_to_pyro = {{
  type = "recipe",
  name = "tbp-plastic-to-pyro",
  category = "chemistry",
  subgroup="fluid-recipes",
  enabled = true,
  energy_required = 5.0,
  ingredients = {{type="item", name="plastic-bar", amount=5}},
  results = {{type="fluid",name="tbp-liquid-pyrolysis-oil", amount=30}},
  crafting_machine_tint =
    {
      primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
      secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
      tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
      quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
    }
}}
data:extend(plastic_to_pyro)

-- convert plastic waste to liquid pyrolysis oil
local plastic_waste_to_pyro = {{
  type = "recipe",
  name = "tbp-plastic-waste-to-pyro",
  category = "chemistry",
  subgroup="fluid-recipes",
  enabled = true,
  energy_required = 5.0,
  ingredients = {{type="item", name="tbp-plastic-waste", amount=10}},
  results = {{type="fluid",name="tbp-liquid-pyrolysis-oil", amount=15}},
  crafting_machine_tint =
    {
      primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
      secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
      tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
      quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
    }
}}
data:extend(plastic_waste_to_pyro)

local plastic_waste_to_plastic = {{
  type = "recipe",
  name = "tbp-plastic-waste-to-plastic",
  category = "smelting",
  energy_required = 4,
  enabled = true,
  ingredients = {{type="item", name="tbp-plastic-waste", amount = 10}},
  results = {{type="item", name = "plastic-bar", amount = 1}}

}}
data:extend(plastic_waste_to_plastic)

local pyro_oil_liquid_to_solid = {{
  type = "recipe",
  name = "tbp-pyrolysis-oil-liquid-to-solid",
  category = "chemistry",
  energy_required = 2,
  enabled = true,
  ingredients = {{type="fluid", name="tbp-liquid-pyrolysis-oil", amount=30}},
  results = {{type="item", name="tbp-solid-pyrolysis-oil", amount = 1}},
  crafting_machine_tint =
    {
      primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
      secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
      tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
      quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
    }
}}
data:extend(pyro_oil_liquid_to_solid)

local copper_sulfate = {{
  type = "item",
  name = "tbp-copper-sulfate",
  icon = "__toms-byproducts__/graphics/icons/copper-sulfate.png",
  icon_size = 64, icon_mipmaps = 4,
  order = "z[tbp-copper-sulfate]",
  subgroup = "intermediate-product",
  stack_size = 50
}}
data:extend(copper_sulfate)

local copper_sulfate_decomp = {{
  type = "recipe",
  name = "tbp-copper-sulfate-decomp",
  category = "chemistry",
  energy_required = 0.5,
  icon = "__toms-byproducts__/graphics/icons/copper-sulfate.png",
  icon_size = 64, icon_mipmaps = 4,
  enabled = true,
  ingredients = {{type="item", name="tbp-copper-sulfate", amount = 1}, {type="fluid", name="water", amount = 1}},
  results = {{type="item", name = "copper-plate", amount = 1, probability = 0.1}, {type="item", name="sulfur", amount = 1, probability = 0.1}},
  subgroup = "intermediate-product"
}}
data:extend(copper_sulfate_decomp)

local copper_sulfate_to_lube = {{
  type = "recipe",
  name = "tbp-copper-sulfate-to-lube",
  category = "chemistry",
  energy_required = 2,
  icon = "__toms-byproducts__/graphics/icons/copper-sulfate.png",
  icon_size = 64, icon_mipmaps = 4,
  enabled = true,
  ingredients = {{type="item", name="tbp-copper-sulfate", amount = 1}, {type="fluid", name="tbp-liquid-pyrolysis-oil", amount = 10}},
  results = {{type="fluid", name = "lubricant", amount = 1}},
  subgroup = "fluid-recipes"
}}
data:extend(copper_sulfate_to_lube)


