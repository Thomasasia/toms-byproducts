-- recipe_defs.lua

-- add a new recipe category to prevent hand crafting of refining
data:extend({{
  type = "recipe-category",
  name = "tbp-byptoduct-refining"
}})

-- add byproduct refining to all assembling machines
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "tbp-byptoduct-refining")
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "tbp-byptoduct-refining")
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "tbp-byptoduct-refining")

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

-- extract trace minerals from slag
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
      probability = 0.05,
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

-- the advanced version turns the spent etchant directly into copper cables, which is more efficient if you plan on making it copper cables anyway.
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

-- smelting plastic waste down into plastic
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

-- turn pyrolysis oil into the solid fuel version
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

-- decompose copper sulfate into sulfur and copper
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

-- turn copper sulfate into lube using pyrolysis oil. 
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


