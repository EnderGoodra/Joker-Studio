----------------------------------------------
------------MOD CODE -------------------------

--- ==============
---  LOCALIZATION
--- ==============
local NFS = require("nativefs")
Workshop = SMODS.current_mod
local _p = ""
for i in string.gmatch(Workshop.path, '([^/]+)') do
    FolderName = i
end

--Mod Icon
SMODS.Atlas{
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
}

CustomJokerConditions = {
    none = nil,
    [1] = {
        -- Joker scored
        type = "joker_main",
        loc_key = "cj_condition_joker_main",
        order = 1,
        min_tier = 1,
        effects = {
            none = nil,
            [1] = {
                type = "chips",
                loc_key = "cj_effect_chips",
                order = 1,
                amount = { 25, 75, 125, 200}
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                order = 2,
                amount = { 10, 20, 35, 50}
            },
            [3] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                order = 3,
                min_tier = 2,
                amount = { 0, 1.5, 2, 3}
            },
            [4] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 4,
                amount = { 3, 5, 7, 10}
            },
        }
    },
    [2] = {
        -- Hand discarded
        type = "hand_discard",
        loc_key = "cj_condition_hand_discard",
        min_tier = 1,
        order = 2,
        effects = {
            none = nil,
            [1] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 1,
                amount = { 1, 2, 3, 5}
            },
            [2] = {
                type = "card_chance",
                set = "Tarot",
                loc_key = "cj_effect_tarot_chance",
                order = 2,
                amount = { 8, 5, 3, 1},
                eval_text = {
                    color = G.C.PURPLE,
                    loc_message = "k_plus_tarot"
                }
            },
            [3] = {
                type = "card_chance",
                set = "Planet",
                loc_key = "cj_effect_planet_chance",
                order = 3,
                amount = { 8, 5, 3, 1},
                eval_text = {
                    color = G.C.SECONDARY_SET.Planet,
                    loc_message = "k_plus_planet"
                }
            },
            [4] = {
                dependency = "MoreFluff",
                type = "card_chance",
                set = "Colour",
                loc_key = "cj_effect_mf_colour_chance",
                missing_loc_key = "cj_missing_mod_morefluff",
                order = 5,
                amount = { 8, 5, 3, 1},
                eval_text = {
                    color = G.C.SECONDARY_SET.Colour,
                    loc_message = "k_plus_colour"
                }
            },
            [5] = {
                type = "card_chance",
                set = "Spectral",
                loc_key = "cj_effect_spectral_chance",
                order = 4,
                min_tier = 3,
                amount = { 10, 7, 4, 2},
                eval_text = {
                    color = G.C.SECONDARY_SET.Spectral,
                    loc_message = "k_plus_spectral"
                }
            },
        }
    },
    [3] = {
        -- End of Round
        type = "round_end",
        loc_key = "cj_condition_round_end",
        min_tier = 1,
        order = 3,
        effects = {
            none = nil,
            [1] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 1,
                amount = { 5, 8, 12, 15}
            },
            [2] = {
                type = "card_create",
                set = "Joker",
                loc_key = "cj_effect_joker_create",
                loc_col = { G.C.BLUE, G.C.BLUE, G.C.GREEN, G.C.RED },
                min_tier = 2,
                order = 2,
                amount = { "common", "common", "uncommon", "rare"},
                eval_text = {
                    color = G.C.BLUE,
                    loc_message = "k_plus_joker"
                }
            }
        }
    },
    [4] = {
        -- First hand played
        type = "first_hand",
        loc_key = "cj_condition_first_hand",
        min_tier = 2,
        order = 4,
        effects = {
            none = nil,
            [1] = {
                type = "chips",
                loc_key = "cj_effect_chips",
                order = 1,
                amount = { 100, 150, 200, 300}
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                order = 2,
                amount = { 25, 40, 60, 95}
            },
            [3] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                order = 3,
                min_tier = 2,
                amount = { 2, 3, 5, 8}
            },
            [4] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 4,
                amount = { 5, 10, 15, 20}
            },
        }
    },
    [5] = {
        -- Last hand played
        type = "last_hand",
        loc_key = "cj_condition_last_hand",
        min_tier = 2,
        order = 5,
        effects = {
            none = nil,
            [1] = {
                type = "chips",
                loc_key = "cj_effect_chips",
                order = 1,
                amount = { 100, 150, 200, 300}
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                order = 2,
                amount = { 25, 40, 60, 95}
            },
            [3] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                order = 3,
                min_tier = 2,
                amount = { 2, 3, 5, 8}
            },
            [4] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 4,
                amount = { 5, 10, 15, 20}
            },
        }
    },
    [6] = {
        -- Each scored card
        type = "scoring_cards",
        loc_key = "cj_condition_scoring_cards",
        min_tier = 1,
        order = 6,
        effects = {
            none = nil,
            [1] = {
                type = "chips",
                loc_key = "cj_effect_chips",
                order = 1,
                amount = { 10, 20, 30, 40}
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                order = 2,
                amount = { 2, 4, 7, 10}
            },
            [3] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                order = 3,
                min_tier = 2,
                amount = { 0, 1.1, 1.25, 1.5}
            },
            [4] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 4,
                amount = { 1, 2, 3, 4}
            },
            [5] = {
                type = "retrigger",
                loc_key = "cj_effect_retrigger",
                order = 5,
                min_tier = 3,
                amount = { 0, 0, 1, 2}
            },
        }
    },
}

-- SMODS.Keybind {
--     key_pressed = "m",
--     action = function(self)
--         print(inspectDepth(Workshop.config))
--     end
-- }

local openFiles = {
    "ui.lua",
    "jokers.lua",
    "consumables.lua",
    "decks.lua",
    "vouchers.lua",
    "tags.lua"
}

Workshop.reset_game_globals = function(run_start)
    if run_start then
        if Workshop.config.run_reset == true then
            ClearCustomJokerData()
        end
    end
end

ValidateCustomJokerFiles = function()
    for i=1,2 do
        if not NFS.getInfo(Workshop.path..'assets/'..i..'x/custom') then
            NFS.createDirectory(Workshop.path..'assets/'..i..'x/custom')
        end

        for j=1,5 do
            local info = NFS.getInfo(Workshop.path..'assets/'..i..'x/custom/joker'..j..'.png')
            if not info or info.size == 0 or info.size == nil then
                local data, size = NFS.read(Workshop.path..'assets/'..i..'x/custom_joker_base.png')
                local success, message NFS.write(Workshop.path..'assets/'..i..'x/custom/joker'..j..'.png', data)
            end
        end
    end
end

ClearCustomJokerData = function()
    for i=1,2 do
        if NFS.getInfo(Workshop.path..'assets/'..i..'x/custom') then
            for j=1,5 do
                if NFS.getInfo(Workshop.path..'assets/'..i..'x/custom/joker'..j..'.png') then
                    local was_removed = NFS.remove(Workshop.path..'assets/'..i..'x/custom/joker'..j..'.png')
                    if not was_removed then
                        do_restart = false
                        sendErrorMessage("Failed to delete: assets/"..i.."x/custom/joker"..j..".png\nMake sure the file isn't open and try again")
                    end
                end
            end
        end
    end
    for i=1,5 do
        Workshop.config.custom_jokers["joker"..i] = {
            in_use = false,
            condition = 0,
            effect = 0
        }
    end
    SMODS.save_mod_config(Workshop)

    ValidateCustomJokerFiles()
    ReloadCustomJokerAtlas()
end

ReloadCustomJokerAtlas = function()
    for i=1,5 do 
        G.ASSET_ATLAS["egjs_atlas_custom"..i].image = love.graphics.newImage('/mods/'..FolderName..'/assets/'..G.SETTINGS.GRAPHICS.texture_scaling..'x/custom/joker'..i..'.png', {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling})   
    end
end

ValidateCustomJokerFiles()

-- Load Files
for k, v in pairs(openFiles) do
    local _file, _error = SMODS.load_file("content/"..v)
    if _error then
        print("Error loading "..v)
    else
        local loadedFile = _file()
    end
end
----------------------------------------------
------------MOD CODE END----------------------