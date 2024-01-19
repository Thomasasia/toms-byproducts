-- barreling.lua

-- in the case of a migration, this script will ensure the proper barreling recipes are present. 


for index, force in pairs(game.forces) do
  if force.technologies["oil-processing"].researched then -- When the oil processing is already researched, we need to enable the the recipes it unlocks
    if settings.startup["tbp-enable-plastic-waste"].value then
      force.recipes["fill-tbp-liquid-pyrolysis-oil-barrel"].enabled = true
      force.recipes["empty-tbp-liquid-pyrolysis-oil-barrel"].enabled = true
    end
    if settings.startup["tbp-enable-ash-sludge"].value then
      force.recipes["fill-tbp-ash-sludge-barrel"].enabled = true
      force.recipes["empty-tbp-ash-sludge-barrel"].enabled = true
    end
    if settings.startup["tbp-enable-petroleum-sludge"].value then
      force.recipes["fill-tbp-petroleum-sludge-barrel"].enabled = true
      force.recipes["empty-tbp-petroleum-sludge-barrel"].enabled = true
    end
  end
end

--fill-tbp-liquid-pyrolysis-oil-barrel
--empty-tbp-liquid-pyrolysis-oil-barrel