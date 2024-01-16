-- data-final-fixes.lua

-- add liquid pyrolysis oil to the flamethrower turret's viable ammo
table.insert(data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids, {type="tbp-liquid-pyrolysis-oil", damage_modifier=1.15})