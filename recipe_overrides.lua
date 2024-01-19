--recipe_overrides.lua

-- function to add product to recipe intelligently.
-- adds the byproducts instead of overwriting, to allow for mod support!
-- byproducts is a table
local function add_byproduct(recipe, byproducts, setting)
  if not setting.value then -- check setting, if the setting fails then dont do anything
    return
  end
  -- check to see if it has a standard result
  if (recipe.result ~= "" and recipe.result ~= nil) then
    local count = 1
    if(recipe.result_count ~= nil) then
      count = recipe.result_count
      recipe.result_count = nil
    end
    recipe.results = {{type="item", name=recipe.result, amount = count}}
    recipe.main_product = recipe.result
    recipe.result = nil -- set to nil to increase mod compatibility
  end
  for i, product in pairs(byproducts) do
    -- inserts at the end, so that the byproducts are removed from machines last
    table.insert(recipe.results, #recipe.results, product)
  end
  
end

-- add an icon and main product, for stuff like plastic
local function add_byproduct_specify(recipe, byproducts, main_product, setting)
  if not setting.value then -- check setting, if the setting fails then dont do anything
    return
  end
  recipe.main_product = main_product
  add_byproduct(recipe, byproducts, setting)
  
end

-- use the expensive varients of the functions when the recipe has normal and expensive varients
local function add_byproduct_expensive(recipe, byproducts, setting)
  --recipe.subgroup = subgroup
  -- check to see if it has a standard result
  if not setting.value then -- check setting, if the setting fails then dont do anything
    return
  end
  if (recipe.normal.result ~= "" and recipe.normal.result ~= nil) then
    local expcount = 1
    local normcount = 1
    if(recipe.normal.result_count ~= nil) then
      normcount = recipe.normal.result_count
    end
    if(recipe.expensive.result_count ~= nil) then
      expcount = recipe.expensive.result_count
    end
    recipe.result_count = nil
    recipe.expensive.result_count = nil
    recipe.normal.result_count = nil
    recipe.normal.results = {{type="item", name=recipe.normal.result, amount = normcount}}
    recipe.expensive.results = {{type="item", name=recipe.expensive.result, amount = expcount}}
    recipe.main_product = recipe.normal.result
    recipe.normal.main_product = recipe.normal.result
    recipe.expensive.main_product = recipe.expensive.result
    recipe.result = nil
    recipe.normal.result = nil
    recipe.expensive.result = nil
  end
  for i, product in pairs(byproducts) do
    -- inserts at the end, so that the byproducts are removed from machines last
    table.insert(recipe.normal.results, #recipe.normal.results, product)
    table.insert(recipe.expensive.results, #recipe.expensive.results, product)
  end
  
end

local function add_byproduct_expensive_specify(recipe, byproducts,main_product, setting)
  if not setting.value then -- check setting, if the setting fails then dont do anything
    return
  end
  recipe.normal.main_product = main_product
  recipe.expensive.main_product = main_product
  recipe.main_product = main_product  
  add_byproduct_expensive(recipe, byproducts, setting)
end

-- if a furnace has less than 2 output slots, set it to two. Once again for better mod support (although i doubt many mods set this to 3)
local function ensure_furance_room(furnace)
    if furnace.result_inventory_size < 2 then
        furnace.result_inventory_size = 2
    end
end


-- plate slag
add_byproduct(data.raw["recipe"]["iron-plate"], {{type="item", name="tbp-slag", amount=1}}, settings.startup["tbp-enable-slag"])
add_byproduct(data.raw["recipe"]["copper-plate"], {{type="item", name="tbp-slag", amount=1}}, settings.startup["tbp-enable-slag"])

-- steel slag modifications
add_byproduct_expensive_specify(data.raw["recipe"]["steel-plate"], {{type="item", name="tbp-slag", amount = 1, probability = 0.25}},"steel-plate", settings.startup["tbp-enable-slag"])

-- increase furnace inventory to make room for slag
ensure_furance_room(data.raw["furnace"]["stone-furnace"])
ensure_furance_room(data.raw["furnace"]["steel-furnace"])
ensure_furance_room(data.raw["furnace"]["electric-furnace"])


-- modify uranium processing recipe
add_byproduct(data.raw["recipe"]["uranium-processing"], {{type="item", name="tbp-slag", amount = 3}}, settings.startup["tbp-enable-slag"])

-- plastic bar waste
add_byproduct_specify(data.raw["recipe"]["plastic-bar"], {{type="item", name = "tbp-plastic-waste", amount = 1}}, "plastic-bar", settings.startup["tbp-enable-plastic-waste"])

-- electronic circuit waste
add_byproduct_expensive_specify(data.raw["recipe"]["electronic-circuit"],{{type="item", name="tbp-spent-etchant", amount=1}}, "electronic-circuit", settings.startup["tbp-enable-spent-etchant"])

---advanced circuit waste
add_byproduct_expensive_specify(data.raw["recipe"]["advanced-circuit"], {{type="item", name="tbp-spent-etchant", amount=1}}, "advanced-circuit", settings.startup["tbp-enable-spent-etchant"])
add_byproduct_expensive_specify(data.raw["recipe"]["advanced-circuit"], {{type="item", name="tbp-plastic-waste", amount = 1}}, "advanced-circuit", settings.startup["tbp-enable-plastic-waste"])

--processing unit waste
add_byproduct_expensive_specify(data.raw["recipe"]["processing-unit"], {{type="item", name="tbp-spent-etchant", amount=1}}, "processing-unit", settings.startup["tbp-enable-spent-etchant"])
add_byproduct_expensive_specify(data.raw["recipe"]["processing-unit"], {{type="item", name="tbp-copper-sulfate", amount = 1}}, "processing-unit", settings.startup["tbp-enable-copper-sulfate"])

-- rocket control unit waste
add_byproduct(data.raw["recipe"]["rocket-control-unit"], {{type="item", name="tbp-spent-etchant", amount=1}}, settings.startup["tbp-enable-spent-etchant"])
add_byproduct(data.raw["recipe"]["rocket-control-unit"], {{type="item", name="tbp-copper-sulfate", amount = 1}}, settings.startup["tbp-enable-copper-sulfate"])
add_byproduct(data.raw["recipe"]["rocket-control-unit"], {{type="item", name="tbp-plastic-waste", amount = 1}}, settings.startup["tbp-enable-plastic-waste"])

-- battery waste
add_byproduct_expensive(data.raw["recipe"]["battery"], {{type="item", name="tbp-copper-sulfate", amount = 1}}, settings.startup["tbp-enable-copper-sulfate"])

-- military science waste
add_byproduct(data.raw["recipe"]["military-science-pack"], {{type="item", name = "tbp-slag", amount = 1}}, settings.startup["tbp-enable-slag"])


-- production science waste
add_byproduct(data.raw["recipe"]["production-science-pack"], {{type="item", name = "tbp-slag", amount = 1}}, settings.startup["tbp-enable-slag"])

-- utility science waste
add_byproduct(data.raw["recipe"]["utility-science-pack"], {{type="item", name = "tbp-spent-etchant", amount = 1}}, settings.startup["tbp-enable-spent-etchant"])

-- chemical science waste
add_byproduct(data.raw["recipe"]["chemical-science-pack"], {{type="item", name = "tbp-plastic-waste", amount = 1}}, settings.startup["tbp-enable-plastic-waste"])
add_byproduct(data.raw["recipe"]["chemical-science-pack"], {{type="item", name="tbp-copper-sulfate", amount = 1}}, settings.startup["tbp-enable-copper-sulfate"])

-- lubricant waste
add_byproduct_specify(data.raw["recipe"]["lubricant"], {{type="fluid", name="tbp-petroleum-sludge", amount = 5}}, "lubricant", settings.startup["tbp-enable-petroleum-sludge"])

-- sulfur waste
add_byproduct_specify(data.raw["recipe"]["sulfur"], {{type="fluid", name="tbp-petroleum-sludge", amount = 5}}, "sulfur", settings.startup["tbp-enable-petroleum-sludge"])

-- fuel cube waste
add_byproduct_specify(data.raw["recipe"]["solid-fuel-from-petroleum-gas"], {{type="fluid", name="tbp-petroleum-sludge", amount = 5}}, "solid-fuel", settings.startup["tbp-enable-petroleum-sludge"])
add_byproduct_specify(data.raw["recipe"]["solid-fuel-from-light-oil"], {{type="fluid", name="tbp-petroleum-sludge", amount = 5}}, "solid-fuel", settings.startup["tbp-enable-petroleum-sludge"])
add_byproduct_specify(data.raw["recipe"]["solid-fuel-from-heavy-oil"], {{type="fluid", name="tbp-petroleum-sludge", amount = 10}}, "solid-fuel", settings.startup["tbp-enable-petroleum-sludge"])

-- plutonium
add_byproduct(data.raw["recipe"]["nuclear-fuel-reprocessing"], {{type="item", name = "tbp-plutonium", amount = 1, probability = 0.5}}, settings.startup["tbp-enable-plutonium"])