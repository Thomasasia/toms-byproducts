-- barreling.lua

-- in the case of a migration, this script will ensure the proper barreling recipes are present. 


for index, force in pairs(game.forces) do
  if force.technologies["oil-processing"].researched then -- When the oil processing is already researched, we need to enable the the recipes it unlocks
    force.recipes["fill-tbp-liquid-pyrolysis-oil-barrel"].enabled = true
    force.recipes["empty-tbp-liquid-pyrolysis-oil-barrel"].enabled = true
    force.recipes["fill-tbp-ash-sludge-barrel"].enabled = true
    force.recipes["empty-tbp-ash-sludge-barrel"].enabled = true
  end
end

--fill-tbp-liquid-pyrolysis-oil-barrel
--empty-tbp-liquid-pyrolysis-oil-barrel