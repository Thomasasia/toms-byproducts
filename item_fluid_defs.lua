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

-- ash sludge
-- more purple
local ash_sludge = {{
    type = "fluid",
    name = "tbp-ash-sludge",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=37,g=25,b=56},
    flow_color = {r=37,g=25,b=56},
    icon = "__toms-byproducts__/graphics/icons/ash-sludge.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-z[tbp-ash-sludge]",
    auto_barrel = true

}}
data:extend(ash_sludge)

-- ash sludge
-- more grey
local ash_sludge = {{
    type = "fluid",
    name = "tbp-petroleum-sludge",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r=65,g=61,b=71},
    flow_color = {r=65,g=61,b=71},
    icon = "__toms-byproducts__/graphics/icons/petroleum-sludge.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-z[tbp-petroleum-sludge]",
    auto_barrel = true

}}
data:extend(ash_sludge)

local plutonium = {
    {
    type = "item",
    name = "tbp-plutonium",
    icon = "__toms-byproducts__/graphics/icons/plutonium.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__toms-byproducts__/graphics/icons/plutonium.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          blend_mode = "additive",
          size = 64,
          filename = "__toms-byproducts__/graphics/icons/plutonium.png",
          scale = 0.25,
          tint = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
          mipmap_count = 4
        }
      }
    },
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[plutonium]",
    stack_size = 100
  }
}
data:extend(plutonium)

local plutonium_fuel_cell = {
    {
    type = "item",
    name = "tbp-plutonium-fuel-cell",
    icon = "__toms-byproducts__/graphics/icons/plutonium-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__toms-byproducts__/graphics/icons/plutonium-fuel-cell.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__toms-byproducts__/graphics/icons/plutonium-fuel-cell.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    subgroup = "intermediate-product",
    order = "r[uranium-processing]-a[tbp-plutonium-fuel-cell]",
    fuel_category = "nuclear",
    burnt_result = "tbp-used-up-plutonium-fuel-cell",
    fuel_value = "10GJ",
    stack_size = 50
  }
}
data:extend(plutonium_fuel_cell)

local used_plutonium_fuel_cell = {
  {
    type = "item",
    name = "tbp-used-up-plutonium-fuel-cell",
    icon = "__toms-byproducts__/graphics/icons/used-up-plutonium-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[used-up-plutonium-fuel-cell]",
    stack_size = 50
  }
}
data:extend(used_plutonium_fuel_cell)

local plutonium_fuel = {
    {
    type = "item",
    name = "tbp-plutonium-fuel",
    icon = "__toms-byproducts__/graphics/icons/plutonium-fuel.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__toms-byproducts__/graphics/icons/plutonium-fuel.png",
          scale = 0.25,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = "__toms-byproducts__/graphics/icons/plutonium-fuel.png",
          scale = 0.25,
          mipmap_count = 4
        }
      }
    },
    fuel_category = "chemical",
    fuel_value = "1.5GJ",
    fuel_acceleration_multiplier = 2.7,
    fuel_top_speed_multiplier = 1.2,
    fuel_glow_color = {r = 8, g = 88, b = 199},
    subgroup = "intermediate-product",
    order = "q[plutonium-rocket-fuel]",
    stack_size = 1
  }
}
data:extend(plutonium_fuel)