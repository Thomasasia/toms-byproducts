--data.lua

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

local hydrogen = {
    {
    type = "fluid",
    name = "hydrogen",
    default_temperature = 25,
    max_temperature = 100,
    auto_barrel = true,
    base_color = { r = 0.50, g = 0.50, b = 0.50 },
    flow_color = { r = 0.50, g = 0.50, b = 0.50 },
    gas_temperature = 25,
    icon = "__toms-byproducts__/graphics/icons/liquid-pyrolysis-oil.png",
    icon_size = 64,
    icon_mipmaps = 4,
    order = "ya01[hydrogen]",
  },
}

data:extend(liquid_pyrolysis_oil, hydrogen)


require("data_overrides")

