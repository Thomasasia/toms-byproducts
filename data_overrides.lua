--data_overrides.lua



-- slag definitions
local slag = table.deepcopy(data.raw["item"]["stone"])
slag.name = "slag"
slag.stack_size = slag.stack_size * 2
local slag_tint = {r=0.75, g=0.75, b=0.75, a=1} -- darken
slag.order = "z[slag]"
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

-- spent etchant
local spent_etchant = {{
  type = "item",
  name = "spent-etchant",
  icon = "__toms-byproducts__/graphics/icons/spent-etchant.png",
  icon_size = 64, icon_mipmaps = 4,
  order = "z[spent-etchant]",
  subgroup = "intermediate-product",
  stack_size = 100
}}
data:extend(spent_etchant)

-- metal extraction from spent etchant
local spent_etchant_to_copper = {{
  type = "recipe",
  name = "etchant-metal-reclamation",
  category = "byproduct-refining",
  enabled = true,
  energy_required = 6,
  ingredients = {{"spent-etchant", 10}},
  result = "copper-plate"
}}
data:extend(spent_etchant_to_copper)

local spent_etchant_to_copper_adv = {{
  type = "recipe",
  name = "etchant-advanced-metal-reclamation",
  category = "byproduct-refining",
  enabled = true,
  energy_required = 3,
  ingredients = {{"spent-etchant", 5}},
  result = "copper-cable"
}}
data:extend(spent_etchant_to_copper_adv)

-- plastic waste
local plastic_waste = {{
  type = "item",
  name = "plastic-waste",
  icon = "__toms-byproducts__/graphics/icons/plastic-waste.png",
  icon_size = 64, icon_mipmaps = 4,
  order = "z[plastic-waste]",
  subgroup = "intermediate-product",
  stack_size = 100
  
}}
data:extend(plastic_waste)

-- solid pyrolysis oil
local solid_pyrolysis_oil = {{
  type = "item",
  name = "solid-pyrolysis-oil",
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

-- liquid_pyrolysis_oil is in data.lua to allow autobarreling
-- liquid pyrolysis oil added here for barreling
local liquid_pyrolysis_oil ={{
  type = "fluid",
  name = "liquid-pyrolysis-oil",
  default_temperature = 25,
  heat_capacity = "0.1KJ",
  base_color = {r=0.8,g=0.8,b=0.8},
  flow_color = {r=0.8,g=0.8,b=0.8},
  icon = "__toms-byproducts__/graphics/icons/liquid-pyrolysis-oil.png",
  icon_size = 64, icon_mipmaps = 4,
  order = "a[fluid]-z[liquid_pyrolysis_oil]",
  auto_barrel = true
}}
data:extend(liquid_pyrolysis_oil)

table.insert(data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids, {type="liquid-pyrolysis-oil", damage_modifier=1.15})

-- convert plastic to liquid pyrolysis oil
local plastic_to_pyro = {{
  type = "recipe",
  name = "plastic-to-pyro",
  category = "chemistry",
  subgroup="fluid-recipes",
  enabled = true,
  energy_required = 5.0,
  ingredients = {{type="item", name="plastic-bar", amount=5}},
  results = {{type="fluid",name="liquid-pyrolysis-oil", amount=50}}
}}
data:extend(plastic_to_pyro)

-- convert plastic waste to liquid pyrolysis oil
local plastic_waste_to_pyro = {{
  type = "recipe",
  name = "plastic-waste-to-pyro",
  category = "chemistry",
  subgroup="fluid-recipes",
  enabled = true,
  energy_required = 5.0,
  ingredients = {{type="item", name="plastic-waste", amount=10}},
  results = {{type="fluid",name="liquid-pyrolysis-oil", amount=25}}
}}
data:extend(plastic_waste_to_pyro)

local plastic_waste_to_plastic = {{
  type = "recipe",
  name = "plastic-waste-to-plastic",
  category = "smelting",
  energy_required = 2,
  enabled = true,
  ingredients = {{type="item", name="plastic-waste", amount = 10}},
  results = {{type="item", name = "plastic-bar", amount = 1}}

}}
data:extend(plastic_waste_to_plastic)

local pyro_oil_liquid_to_solid = {{
  type = "recipe",
  name = "pyrolysis-oil-liquid-to-solid",
  category = "chemistry",
  energy_required = 1,
  enabled = true,
  ingredients = {{type="fluid", name="liquid-pyrolysis-oil", amount=50}},
  results = {{type="item", name="solid-pyrolysis-oil", amount = 1}}
}}
data:extend(pyro_oil_liquid_to_solid)




-- plastic bar waste
data.raw["recipe"]["plastic-bar"].result_count = 3
table.insert(data.raw["recipe"]["plastic-bar"].results, 0, {type="item", name = "plastic-waste", amount = 1})
data.raw["recipe"]["plastic-bar"].main_product = "plastic-bar"

-- electronic circuit waste
data.raw["recipe"]["electronic-circuit"].result_count = 2
local ecirc_results = {
  {type="item", name="spent-etchant", amount=1},
  {type="item", name="electronic-circuit", amount=1}
}
data.raw["recipe"]["electronic-circuit"].expensive.results = ecirc_results
data.raw["recipe"]["electronic-circuit"].normal.results = ecirc_results
data.raw["recipe"]["electronic-circuit"].normal.main_product = "electronic-circuit"
data.raw["recipe"]["electronic-circuit"].expensive.main_product = "electronic-circuit"

--advanced circuit waste
data.raw["recipe"]["advanced-circuit"].result_count = 3
local acirc_results = {
  {type="item", name="spent-etchant", amount=1},
  {type="item", name="plastic-waste", amount = 1},
  {type="item", name="advanced-circuit", amount=1}
}
data.raw["recipe"]["advanced-circuit"].expensive.results = acirc_results
data.raw["recipe"]["advanced-circuit"].normal.results = acirc_results
data.raw["recipe"]["advanced-circuit"].normal.main_product = "advanced-circuit"
data.raw["recipe"]["advanced-circuit"].expensive.main_product = "advanced-circuit"

--processing unit waste
data.raw["recipe"]["processing-unit"].result_count = 2
local pu_results = {
  {type="item", name="spent-etchant", amount=1},
  {type="item", name="processing-unit", amount=1}
}
data.raw["recipe"]["processing-unit"].expensive.results = pu_results
data.raw["recipe"]["processing-unit"].normal.results = pu_results
data.raw["recipe"]["processing-unit"].normal.main_product = "processing-unit"
data.raw["recipe"]["processing-unit"].expensive.main_product = "processing-unit"

-- rocket control unit waste
data.raw["recipe"]["rocket-control-unit"].result_count = 2
local rcu_results = {
  {type="item", name="spent-etchant", amount=1},
  {type="item", name="rocket-control-unit", amount=1}
}
data.raw["recipe"]["rocket-control-unit"].results = rcu_results
data.raw["recipe"]["rocket-control-unit"].main_product = "rocket-control-unit"

-- military science waste
data.raw["recipe"]["military-science-pack"].result_count = 3
data.raw["recipe"]["military-science-pack"].main_product = "military-science-pack"
data.raw["recipe"]["military-science-pack"].results = {
  {type="item", name = "slag", amount = 1},
  {type="item", name = "military-science-pack", amount = 2}
}

-- production science waste
data.raw["recipe"]["production-science-pack"].result_count = 4
data.raw["recipe"]["production-science-pack"].main_product = "production-science-pack"
data.raw["recipe"]["production-science-pack"].results = {
  {type="item", name = "slag", amount = 1},
  {type="item", name = "production-science-pack", amount = 3}
}

-- utility science waste
data.raw["recipe"]["utility-science-pack"].result_count = 4
data.raw["recipe"]["utility-science-pack"].main_product = "utility-science-pack"
data.raw["recipe"]["utility-science-pack"].results = {
  {type="item", name = "spent-etchant", amount = 1},
  {type="item", name = "utility-science-pack", amount = 3}
}