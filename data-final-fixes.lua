-- data-final-fixes.lua

-- add liquid pyrolysis oil to the flamethrower turret's viable ammo

if settings.startup["tbp-enable-plastic-waste"].value then
    table.insert(data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids, {type="tbp-liquid-pyrolysis-oil", damage_modifier=1.15})
end
if settings.startup["tbp-enable-petroleum-sludge"].value then
    table.insert(data.raw["fluid-turret"]["flamethrower-turret"].attack_parameters.fluids, {type="tbp-petroleum-sludge", damage_modifier=0.95})
end