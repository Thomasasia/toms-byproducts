-- barreling.lua




for index, force in pairs(game.forces) do
  if force.technologies["oil-processing"].researched then -- When the oil processing is already researched, we need to enable the the recipes it unlocks
    force.recipes["fill-tbp-liquid-pyrolysis-oil-barrel"].enabled = true
    force.recipes["empty-tbp-liquid-pyrolysis-oil-barrel"].enabled = true
  end
end

--fill-tbp-liquid-pyrolysis-oil-barrel
--empty-tbp-liquid-pyrolysis-oil-barrel