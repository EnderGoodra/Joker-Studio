----------------------------------------------
------------MOD CODE -------------------------

--- ==============
---  LOCALIZATION
--- ==============
local NFS = require("nativefs")
Workshop = SMODS.current_mod

CustomJokerConditions = {
    [0] = nil,
    [1] = {
        -- Joker scored
        loc_key = "cj_condition_joker_main",
        min_tier = 1,
        effects = {
            [0] = nil,
            [1] = {
                type = "chips",
                loc_key = "cj_effect_chips",
                amount = { 30, 60, 90, 120}
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                amount = { 5, 15, 30, 50}
            },
            [3] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                amount = { 3, 5, 7, 10}
            },
            [4] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                min_tier = 2,
                amount = { 1.25, 1.5, 2, 3}
            },
        }
    },
    [2] = {
        -- Hand discarded
        loc_key = "cj_condition_hand_discard",
        min_tier = 1,
        effects = {
            [0] = nil,
            [1] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                amount = { 1, 2, 3, 4}
            },
            [2] = {
                type = "card_tarot",
                loc_key = "cj_effect_tarot",
                amount = { 8, 5, 3, 1}
            },
            [3] = {
                type = "card_planet",
                loc_key = "cj_effect_planet",
                amount = { 8, 5, 3, 1}
            },
            [4] = {
                type = "card_spectral",
                loc_key = "cj_effect_spectral",
                min_tier = 3,
                amount = { 10, 7, 4, 2}
            },
        }
    },
    -- [2] = {
    --     txt = "When hand discarded..."
    -- },
    -- [3] = {
    --     txt = "When Face card scored..."
    -- },
    -- [3] = nil,
    -- [4] = nil,
    -- [5] = nil,
}

ValidateCustomJokerFiles = function()
    for i=1,2 do
        if not NFS.getInfo(Workshop.path..'assets/'..i..'x/custom') then
            print(i..'x/custom directory built'..(NFS.createDirectory(Workshop.path..'assets/'..i..'x/custom') and 'success' or 'false'))
        end

        for j=1,5 do
            local info = NFS.getInfo(Workshop.path..'assets/'..i..'x/custom/joker'..j..'.png')
            if not info or info.size == 0 or info.size == nil then
                local data, size = NFS.read(Workshop.path..'assets/'..i..'x/custom_joker_base.png')
                local success, message NFS.write(Workshop.path..'assets/'..i..'x/custom/joker'..j..'.png', data)
                print(i..'x/custom/joker'..j..'.png'..(success and ' success' or ' false'))
            end
        end
    end
end

-- function get_unused_cj_slot()
--     for i=1,5 do
--         if Workshop and Workshop.config and Workshop.config.custom_jokers and Workshop.config.custom_jokers["joker"..i] and Workshop.config.custom_jokers["joker"..i].in_use == false then
--             return i
--         end
--     end
--     return 6
-- end

local openFiles = {
    "ui.lua",
    "jokers.lua",
    "consumables.lua",
    "decks.lua",
    "vouchers.lua",
    -- "modifiers.lua",
    "tags.lua"
}

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
