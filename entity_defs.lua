local early_filter_inserter = {

  {
    type = "corpse",
    name = "tbp-picky-inserter-remnants",
    icon = "__toms-byproducts__/graphics/icons/picky-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "inserter-remnants",
    order = "a-b-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (4,
    {
      filename = "__toms-byproducts__/graphics/entity/picky-inserter/remnants/picky-inserter-remnants.png",
      line_length = 1,
      width = 68,
      height = 48,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(4, -2),
      hr_version =
      {
        filename = "__toms-byproducts__/graphics/entity/picky-inserter/remnants/hr-picky-inserter-remnants.png",
        line_length = 1,
        width = 134,
        height = 94,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(3.5, -2),
        scale = 0.5
      }
    })
  },
  {
    type = "inserter",
    name = "tbp-picky-inserter",
    icon = "__toms-byproducts__/graphics/icons/picky-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "inserter"},
    max_health = 150,
    corpse = "tbp-picky-inserter-remnants",
    dying_explosion = "inserter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.4, -0.35}, {0.4, 0.45}},
    damaged_trigger_effect = data.raw["inserter"]["inserter"].damaged_trigger_effect,--hit_effects.entity(),
    energy_per_movement = "10kJ",
    energy_per_rotation = "10kJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "0.4kW"
    },
    extension_speed = 0.03,
    rotation_speed = 0.014,
    filter_count = 1,
    fast_replaceable_group = "inserter",
    next_upgrade = "filter-inserter",
    vehicle_impact_sound = data.raw["inserter"]["inserter"].vehicle_impact_sound, --sounds.generic_impact,
    open_sound = data.raw["inserter"]["inserter"].open_sound,--sounds.machine_open,
    close_sound = data.raw["inserter"]["inserter"].close_sound,--sounds.machine_close,
    working_sound = data.raw["inserter"]["inserter"].working_sound,--sounds.inserter_basic,
    hand_base_picture =
    {
      filename = "__toms-byproducts__/graphics/entity/picky-inserter/picky-inserter-hand-base.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__toms-byproducts__/graphics/entity/picky-inserter/hr-picky-inserter-hand-base.png",
        priority = "extra-high",
        width = 32,
        height = 136,
        scale = 0.25
      }
    },
    hand_closed_picture =
    {
      filename = "__toms-byproducts__/graphics/entity/picky-inserter/picky-inserter-hand-closed.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__toms-byproducts__/graphics/entity/picky-inserter/hr-picky-inserter-hand-closed.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_picture =
    {
      filename = "__toms-byproducts__/graphics/entity/picky-inserter/picky-inserter-hand-open.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__toms-byproducts__/graphics/entity/picky-inserter/hr-picky-inserter-hand-open.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_base_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
      priority = "extra-high",
      width = 8,
      height = 33,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-base-shadow.png",
        priority = "extra-high",
        width = 32,
        height = 132,
        scale = 0.25
      }
    },
    hand_closed_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-closed-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    hand_open_shadow =
    {
      filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
      priority = "extra-high",
      width = 18,
      height = 41,
      hr_version =
      {
        filename = "__base__/graphics/entity/burner-inserter/hr-burner-inserter-hand-open-shadow.png",
        priority = "extra-high",
        width = 72,
        height = 164,
        scale = 0.25
      }
    },
    pickup_position = {0, -1},
    insert_position = {0, 1.2},
    platform_picture =
    {
      sheet =
      {
        filename = "__toms-byproducts__/graphics/entity/picky-inserter/picky-inserter-platform.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = {0.09375, 0},
        hr_version =
        {
          filename = "__toms-byproducts__/graphics/entity/picky-inserter/hr-picky-inserter-platform.png",
          priority = "extra-high",
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        }
      }
    },
    circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
    circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
    circuit_wire_max_distance = inserter_circuit_wire_max_distance,
    default_stack_control_input_signal = inserter_default_stack_control_input_signal
  }}
data:extend(early_filter_inserter)