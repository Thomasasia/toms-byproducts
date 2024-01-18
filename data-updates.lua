--data-updates.lua

-- the recipe changes go in data-updates.lua because most other mods will modify recipes in data.lua.
-- this way regardless if the mod is loaded before or after other mods, it should add the byproducts correctly, and without harming other mods' functionality
require("recipe_overrides")
require("tech_overrides")