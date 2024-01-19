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
  icon = "__toms-byproducts__/graphics/icons/slag-smelting.png",
  icon_size = 64, icon_mipmaps = 4,
  result = "stone-brick",
  allow_decomposition = false
}}
data:extend(slag_bricks_recipe)

-- extract trace minerals from slag
local slag_trace_extraction = {{
  type = "recipe",
  name = "tbp-slag-trace-extraction",
  category = "tbp-byptoduct-refining",
  enabled = false, -- automation
  energy_required = 10,
  ingredients = {{"tbp-slag", 10}},
  icon = "__toms-byproducts__/graphics/icons/slag-trace-extraction.png",
  icon_size = 64, icon_mipmaps = 4,
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
  },
  allow_decomposition = false
}}

data:extend(slag_trace_extraction)


-- metal extraction from spent etchant
local spent_etchant_to_copper = {{
  type = "recipe",
  name = "tbp-etchant-metal-reclamation",
  category = "tbp-byptoduct-refining",
  enabled = false, -- electronics
  energy_required = 6,
  ingredients = {{"tbp-spent-etchant", 10}},
  results = {{type="item", name="copper-plate", amount = 1}},
  icon = "__toms-byproducts__/graphics/icons/etchant-metal-reclamation.png",
  icon_size = 64, icon_mipmaps = 4,
  allow_decomposition = false
}}
data:extend(spent_etchant_to_copper)

-- the advanced version turns the spent etchant directly into copper cables, which is more efficient if you plan on making it copper cables anyway.
local spent_etchant_to_copper_adv = {{
  type = "recipe",
  name = "tbp-etchant-advanced-metal-reclamation",
  category = "tbp-byptoduct-refining",
  enabled = false, -- advanced electronics
  energy_required = 3,
  ingredients = {{"tbp-spent-etchant", 5}},
  result = "copper-cable",
  icon = "__toms-byproducts__/graphics/icons/etchant-advanced-metal-reclamation.png",
  icon_size = 64, icon_mipmaps = 4,
  allow_decomposition = false
}}
data:extend(spent_etchant_to_copper_adv)

-- convert plastic to liquid pyrolysis oil
local plastic_to_pyro = {{
  type = "recipe",
  name = "tbp-plastic-to-pyro",
  category = "chemistry",
  subgroup="fluid-recipes",
  enabled = false, -- plastics
  energy_required = 5.0,
  ingredients = {{type="item", name="plastic-bar", amount=5}},
  results = {{type="fluid",name="tbp-liquid-pyrolysis-oil", amount=30}},
  crafting_machine_tint =
    {
      primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
      secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
      tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
      quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
    },
  icon = "__toms-byproducts__/graphics/icons/plastic-to-pyro.png",
  icon_size = 64, icon_mipmaps = 4,
  allow_decomposition = false
}}
data:extend(plastic_to_pyro)

-- convert plastic waste to liquid pyrolysis oil
local plastic_waste_to_pyro = {{
  type = "recipe",
  name = "tbp-plastic-waste-to-pyro",
  category = "chemistry",
  subgroup="fluid-recipes",
  enabled = false, -- plastics
  energy_required = 5.0,
  ingredients = {{type="item", name="tbp-plastic-waste", amount=10}},
  results = {{type="fluid",name="tbp-liquid-pyrolysis-oil", amount=15}},
  icon = "__toms-byproducts__/graphics/icons/plastic-waste-to-pyro.png",
  icon_size = 64, icon_mipmaps = 4,
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
  enabled = false, -- plastics
  ingredients = {{type="item", name="tbp-plastic-waste", amount = 10}},
  results = {{type="item", name = "plastic-bar", amount = 1}},
  icon = "__toms-byproducts__/graphics/icons/plastic-waste-to-plastic.png",
  icon_size = 64, icon_mipmaps = 4,
  allow_decomposition = false

}}
data:extend(plastic_waste_to_plastic)

-- turn pyrolysis oil into the solid fuel version
local pyro_oil_liquid_to_solid = {{
  type = "recipe",
  name = "tbp-pyrolysis-oil-liquid-to-solid",
  category = "chemistry",
  energy_required = 2,
  enabled = false, -- plastics
  ingredients = {{type="fluid", name="tbp-liquid-pyrolysis-oil", amount=30}},
  results = {{type="item", name="tbp-solid-pyrolysis-oil", amount = 1}},
  crafting_machine_tint =
    {
      primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
      secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
      tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
      quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
    },
  allow_decomposition = false
}}
data:extend(pyro_oil_liquid_to_solid)

-- decompose copper sulfate into sulfur and copper
local copper_sulfate_decomp = {{
  type = "recipe",
  name = "tbp-copper-sulfate-decomp",
  category = "chemistry",
  energy_required = 0.5,
  icon = "__toms-byproducts__/graphics/icons/copper-sulfate-decomp.png",
  icon_size = 64, icon_mipmaps = 4,
  enabled = false, -- sulfur processing
  ingredients = {{type="item", name="tbp-copper-sulfate", amount = 1}, {type="fluid", name="water", amount = 1}},
  results = {{type="item", name = "copper-plate", amount = 1, probability = 0.1}, {type="item", name="sulfur", amount = 1, probability = 0.1}},
  subgroup = "intermediate-product",
  allow_decomposition = false
}}
data:extend(copper_sulfate_decomp)

-- turn copper sulfate into lube using pyrolysis oil. 
local copper_sulfate_to_lube = {{
  type = "recipe",
  name = "tbp-copper-sulfate-to-lube",
  category = "chemistry",
  energy_required = 2,
  icon = "__toms-byproducts__/graphics/icons/copper-sulfate-to-lube.png",
  icon_size = 64, icon_mipmaps = 4,
  enabled = false, -- lubricant
  ingredients = {{type="item", name="tbp-copper-sulfate", amount = 1}, {type="fluid", name="tbp-liquid-pyrolysis-oil", amount = 10}},
  results = {{type="fluid", name = "lubricant", amount = 1}},
  subgroup = "fluid-recipes",
  allow_decomposition = false
}}
data:extend(copper_sulfate_to_lube)

-- turn coal into ash sludge
local coal_ashing = {{
    type = "recipe",
    name = "tbp-coal-ashing",
    category = "chemistry",
    subgroup="fluid-recipes",
    energy_required = 1,
    emissions_multiplier = 2.0,
    icon = "__toms-byproducts__/graphics/icons/ash-sludge.png",
    icon_size = 64, icon_mipmaps = 4,
    enabled = false, -- flamables
    ingredients = {{type="item", name="coal", amount = 5}, {type="fluid", name="water", amount = 30}},
    results = {{type="fluid", name="tbp-ash-sludge", amount = 30}},
    subroup = "intermediate-product"

}}
data:extend(coal_ashing)

-- trace extraction from ash sludge
local ash_trace_extraction = {{
    type = "recipe",
    name = "tbp-ash-trace-extraction",
    subgroup = "intermediate-product",
    category = "chemistry",
    energy_required = 4,
    icon = "__toms-byproducts__/graphics/icons/ash-trace-extraction.png",
    icon_size = 64, icon_mipmaps = 4,
    enabled = false, -- flamables
    ingredients = {{type="fluid", name="tbp-ash-sludge", amount = 60}},
    results = {
    {
      name = "iron-ore",
      probability = 0.75,
      amount = 1
    },
    {
      name = "copper-ore",
      probability = 0.75,
      amount = 1
    },
    {
      name = "stone",
      probability = 0.75,
      amount = 1
    },
    {
      name = "uranium-ore",
      probability = 0.5, -- high chance of uranium to enable north korean style uranium extraction
      amount = 1
    },
    {
      name = "sulfur",
      probability = 0.65,
      amount = 1
    },
    },
    allow_decomposition = false
}}
data:extend(ash_trace_extraction)

-- turn ash sludge into asphalt (cement)
local ash_asphalt = {{
    type = "recipe",
    name = "tbp-ash-asphalt",
    energy_required = 10,
    enabled = false, -- flamables
    category = "crafting-with-fluid",
    ingredients = {{type = "fluid", name = "tbp-ash-sludge", amount = 150}},
    results = {{type="item", name="concrete", amount = "10"}},
    icon = "__toms-byproducts__/graphics/icons/ash-asphalt.png",
    icon_size = 64, icon_mipmaps = 4,
    allow_decomposition = false
}}
data:extend(ash_asphalt)

-- turn petroleum sludge into solid fuel
local solid_fuel_from_petroleum_sludge = {{
    type = "recipe",
    name = "tbp-solid-fuel-from-petroleum-sludge",
    category = "chemistry",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "tbp-petroleum-sludge", amount = 100}
    },
    results=
    {
      {type="item", name="solid-fuel", amount=1}
    },
    icon = "__toms-byproducts__/graphics/icons/solid-fuel-from-petroleum-sludge.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "fluid-recipes",
    enabled = false, -- advanced oil processing
    order = "b[fluid-chemistry]-d[solid-fuel-from-petroleum-sludge]",
    crafting_machine_tint =
    {
      primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
      secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
      tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
      quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
    },
    allow_decomposition = false
}}
data:extend(solid_fuel_from_petroleum_sludge)

-- make explosives using byproducts
local explosives_from_copper_sulfide_and_petroleum_sludge = {{
    type = "recipe",
    name = "tbp-explosives-from-cs-and-ps",
    category = "chemistry",
    crafting_machine_tint =
    {
      primary = {r = 0.968, g = 0.381, b = 0.259, a = 1.000}, -- #f66142ff
      secondary = {r = 0.892, g = 0.664, b = 0.534, a = 1.000}, -- #e3a988ff
      tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000}, -- #fff982ff
      quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}, -- #352b03ff
    },
    energy_required = 5,
    enabled = false, -- explosives
    ingredients = {
        {type = "item", name = "tbp-copper-sulfate", amount = 5},
        {type = "fluid", name = "tbp-petroleum-sludge", amount = 100}
    },
    result = "explosives",
    result_count = 2,
    icon = "__toms-byproducts__/graphics/icons/explosives-from-cs-and-ps.png",
    icon_size = 64, icon_mipmaps = 4,
    allow_decomposition = false
}}
data:extend(explosives_from_copper_sulfide_and_petroleum_sludge)

-- decompose petroleum sludge to gas and ash sludge
local petroleum_sludge_to_petroleum_and_ash_sludge = {{
    type = "recipe",
    name = "tbp-petroleum-sludge-to-petroleum-and-ash",
    category = "chemistry",
    crafting_machine_tint =
    {
      primary = {r = 0.768, g = 0.631, b = 0.768, a = 1.000}, -- #c3a0c3ff
      secondary = {r = 0.659, g = 0.592, b = 0.678, a = 1.000}, -- #a896acff
      tertiary = {r = 0.774, g = 0.631, b = 0.766, a = 1.000}, -- #c5a0c3ff
      quaternary = {r = 0.564, g = 0.364, b = 0.564, a = 1.000}, -- #8f5c8fff
    },
    energy_required = 3,
    enabled = false, -- advanced oil processing
    ingredients = {{type = "fluid", name = "tbp-petroleum-sludge", amount = 100}},
    results = {
        {type = "fluid", name = "petroleum-gas", amount = 30},
        {type = "fluid", name = "tbp-ash-sludge", amount = 30}
    },
    subgroup = "fluid-recipes",
    icon = "__toms-byproducts__/graphics/icons/petroleum-sludge-to-petroleum-and-ash.png",
    icon_size = 64, icon_mipmaps = 4,
    allow_decomposition = false
}}
data:extend(petroleum_sludge_to_petroleum_and_ash_sludge)

-- plutonium fuel cell creation
local plutonium_fuel = {
    {
    type = "recipe",
    name = "tbp-plutonium-fuel",
    energy_required = 90,
    enabled = false, -- nuclear power
    category = "centrifuging",
    ingredients = {{"tbp-plutonium", 1}, {"rocket-fuel", 1}},
    icon = "__toms-byproducts__/graphics/icons/plutonium-fuel.png",
    icon_size = 64, icon_mipmaps = 4,
    result = "tbp-plutonium-fuel"
  }
}
data:extend(plutonium_fuel)

-- plutonium fuel cell
-- gives fewer fuel cells than the uranium recipe, for balance.
local plutonium_fuel_cell = {
    {
    type = "recipe",
    name = "tbp-plutonium-fuel-cell",
    energy_required = 10,
    enabled = false, -- kovarex enrichment process
    ingredients =
    {
      {"iron-plate", 5},
      {"tbp-plutonium", 1},
      {"uranium-238", 6}
    },
    result = "tbp-plutonium-fuel-cell",
    result_count = 3
    }
}
data:extend(plutonium_fuel_cell)

-- get uranium from the spent cells
local plutonium_fuel_reprocessing = {
    {
    type = "recipe",
    name = "tbp-plutonium-fuel-reprocessing",
    energy_required = 60,
    enabled = false, -- nuclear fuel reprocessing
    category = "centrifuging",
    ingredients = {{"tbp-used-up-plutonium-fuel-cell", 5}},
    icon = "__toms-byproducts__/graphics/icons/plutonium-fuel-reprocessing.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-b[plutonium-fuel-reprocessing]",
    main_product = "",
    results = {{"uranium-238", 3}},
    allow_decomposition = false
  }
}
data:extend(plutonium_fuel_reprocessing)