-- control.lua

-- thankfully inspired by https://github.com/AivanF/factorio-AivanF-mods/blob/main/Recipes-Reload/control.lua
function reload_recipes(event)
  -- Enable researched recipes
  for i, force in pairs(game.forces) do
    for _, tech in pairs(force.technologies) do
      if tech.researched then
        for _, effect in pairs(tech.effects) do
          if effect.type == "unlock-recipe" then
            force.recipes[effect.recipe].enabled = true
          end
        end
      end
    end
  end
end

local function disable_recipe(recipe_name)
    for i, force in pairs(game.forces) do
        force.recipes[recipe_name].enabled = false
    end
end

-- sets the default enabled recipes to their respective setting
-- right now there is only one
local function set_setting_enabled_recipe(event)
    for i, force in pairs(game.forces) do
        force.recipes["tbp-picky-inserter"].enabled = settings.startup["tbp-early-game-filter-inserter"].value

        -- selectively enable relevant barrels
        if force.technologies["oil-processing"].researched then
            force.recipes["fill-tbp-liquid-pyrolysis-oil-barrel"].enabled = settings.startup["tbp-enable-plastic-waste"].value
            force.recipes["empty-tbp-liquid-pyrolysis-oil-barrel"].enabled = settings.startup["tbp-enable-plastic-waste"].value
            force.recipes["fill-tbp-ash-sludge-barrel"].enabled = settings.startup["tbp-enable-ash-sludge"].value
            force.recipes["empty-tbp-ash-sludge-barrel"].enabled = settings.startup["tbp-enable-ash-sludge"].value
            force.recipes["fill-tbp-petroleum-sludge-barrel"].enabled = settings.startup["tbp-enable-petroleum-sludge"].value
            force.recipes["empty-tbp-petroleum-sludge-barrel"].enabled = settings.startup["tbp-enable-petroleum-sludge"].value
        end
    end
end

-- disables all recipes, then re enables them based on research
-- this allows settings to change the recipes allowed to the player after they have been researched
local function reset_all_tbp_recipes(event)
    disable_recipe("tbp-slag-trace-extraction")
    disable_recipe("tbp-etchant-metal-reclamation")
    disable_recipe("tbp-etchant-advanced-metal-reclamation")
    disable_recipe("tbp-plastic-to-pyro")
    disable_recipe("tbp-plastic-waste-to-pyro")
    disable_recipe("tbp-plastic-waste-to-plastic")
    disable_recipe("tbp-pyrolysis-oil-liquid-to-solid")
    disable_recipe("tbp-copper-sulfate-decomp")
    disable_recipe("tbp-coal-ashing")
    disable_recipe("tbp-ash-trace-extraction")
    disable_recipe("tbp-ash-asphalt")
    disable_recipe("tbp-solid-fuel-from-petroleum-sludge")
    disable_recipe("tbp-plutonium-fuel")
    disable_recipe("tbp-plutonium-fuel-cell")
    disable_recipe("tbp-plutonium-fuel-reprocessing")
    disable_recipe("tbp-petroleum-sludge-to-petroleum-and-ash")
    disable_recipe("tbp-copper-sulfate-to-lube")
    disable_recipe("tbp-explosives-from-cs-and-ps")
    set_setting_enabled_recipe(event)
    reload_recipes(event)
end



script.on_init(reload_recipes)
script.on_configuration_changed(reset_all_tbp_recipes)
script.on_event(defines.events.on_research_finished, set_setting_enabled_recipe) -- we call this here to prevent disabled fluids appearing in the recipe menu for barreling

commands.add_command(
  "recipes-reload",
  "Reload all recipes from researched technologies",
  reset_all_tbp_recipes
)