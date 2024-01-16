--item_fluid_defs.lua

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

-- liquid pyrolysis oil
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

-- copper sulfate
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

