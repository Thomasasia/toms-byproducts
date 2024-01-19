-- tech_overrides.lua

local function add_tech_recipe_unlock(tech_name, recipe_unlock)
    if (data.raw["technology"][tech_name].effects == nil )then -- if effects are empty, add an empty table
        data.raw["technology"][tech_name].effects = {}
    end
    local unlock = {
        type = "unlock-recipe",
        recipe = recipe_unlock
    }
    table.insert(data.raw["technology"][tech_name].effects, #data.raw["technology"][tech_name].effects, unlock)
end



if settings.startup["tbp-enable-slag"].value then
    add_tech_recipe_unlock("automation", "tbp-slag-trace-extraction")
end
if settings.startup["tbp-enable-spent-etchant"].value then
    add_tech_recipe_unlock("electronics", "tbp-etchant-metal-reclamation")
    add_tech_recipe_unlock("advanced-electronics", "tbp-etchant-advanced-metal-reclamation")
end
if settings.startup["tbp-enable-plastic-waste"].value then
    add_tech_recipe_unlock("plastics", "tbp-plastic-to-pyro")
    add_tech_recipe_unlock("plastics", "tbp-plastic-waste-to-pyro")
    add_tech_recipe_unlock("plastics", "tbp-plastic-waste-to-plastic")
    add_tech_recipe_unlock("plastics", "tbp-pyrolysis-oil-liquid-to-solid")
end
if settings.startup["tbp-enable-copper-sulfate"].value then
    add_tech_recipe_unlock("sulfur-processing", "tbp-copper-sulfate-decomp")
end
if settings.startup["tbp-enable-ash-sludge"].value then
    add_tech_recipe_unlock("flammables", "tbp-coal-ashing")
    add_tech_recipe_unlock("flammables", "tbp-ash-trace-extraction")
    add_tech_recipe_unlock("flammables", "tbp-ash-asphalt")
end
if settings.startup["tbp-enable-petroleum-sludge"].value then
    add_tech_recipe_unlock("advanced-oil-processing", "tbp-solid-fuel-from-petroleum-sludge")
end
if settings.startup["tbp-enable-plutonium"].value then
    add_tech_recipe_unlock("nuclear-power", "tbp-plutonium-fuel")
    add_tech_recipe_unlock("kovarex-enrichment-process", "tbp-plutonium-fuel-cell")
    add_tech_recipe_unlock("nuclear-fuel-reprocessing", "tbp-plutonium-fuel-reprocessing")
end

if (settings.startup["tbp-enable-ash-sludge"].value and settings.startup["tbp-enable-petroleum-sludge"].value) then
    add_tech_recipe_unlock("advanced-oil-processing", "tbp-petroleum-sludge-to-petroleum-and-ash")
end

if settings.startup["tbp-enable-plastic-waste"].value and settings.startup["tbp-enable-copper-sulfate"].value then
    add_tech_recipe_unlock("lubricant", "tbp-copper-sulfate-to-lube")
end

if settings.startup["tbp-enable-copper-sulfate"].value and settings.startup["tbp-enable-petroleum-sludge"].value then
    add_tech_recipe_unlock("explosives", "tbp-explosives-from-cs-and-ps")
end