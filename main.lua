----------------------------------------------
------------MOD CODE -------------------------

--- ==============
---  LOCALIZATION
--- ==============
nfs = nativefs or require("nativefs")

JokerStudio = SMODS.current_mod
local _p = ""
for i in string.gmatch(JokerStudio.path, '([^/]+)') do
    FolderName = i
end

--Mod Icon
SMODS.Atlas{
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
}

JokerStudio.CustomJokerConditions = {
    none = nil,
    [1] = { -- Joker scored
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
                amount = { 25, 75, 125, 200},
                func = function(card, context, effect, amount)
                    if context.joker_main then
                        return {
                            message = localize{type='variable',key='a_chips',vars={amount}},
                            chip_mod = amount
                        }
                    end
                end
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                order = 2,
                amount = { 10, 20, 35, 50},
                func = function(card, context, effect, amount)
                    if context.joker_main then
                        return {
                            message = localize{type='variable',key='a_mult',vars={amount}},
                            mult_mod = amount
                        }
                    end
                end
            },
            [3] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                order = 3,
                min_tier = 2,
                amount = { 0, 1.5, 2, 3},
                func = function(card, context, effect, amount)
                    if context.joker_main then
                        return {
                            message = localize{type='variable',key='a_xmult',vars={amount}},
                            Xmult_mod = amount
                        }
                    end
                end
            },
            [4] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 4,
                amount = { 3, 5, 7, 10},
                func = function(card, context, effect, amount)
                    if context.joker_main then
                        ease_dollars(amount)
                        return {
                            message = localize('$')..amount,
                            colour = G.C.MONEY,
                            card = card
                        }
                    end
                end
            },
        }
    },
    [2] = { -- Hand discarded
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
                amount = { 1, 2, 3, 5},
                func = function(card, context, effect, amount)
                    if context.pre_discard and not context.repetition then
                        ease_dollars(amount)
                        return {
                            message = localize('$')..amount,
                            colour = G.C.MONEY,
                            card = card
                        }
                    end
                end
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
                },
                func = function(card, context, effect, amount)
                    if context.pre_discard and not context.repetition then
                        if pseudorandom('cj_chance'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal/amount and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local card = SMODS.create_card({set = effect.set, no_edition = true, area = G.consumeables, key_append = 'cj_chance'})
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                    return true
                                end)}))
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize(effect.eval_text.loc_message or 'k_plus_tarot'), colour = effect.eval_text.colour or G.C.PURPLE})  
                        end
                    end
                end
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
                },
                func = function(card, context, effect, amount)
                    if context.pre_discard and not context.repetition then
                        if pseudorandom('cj_chance'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal/amount and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local card = SMODS.create_card({set = effect.set, no_edition = true, area = G.consumeables, key_append = 'cj_chance'})
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                    return true
                                end)}))
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize(effect.eval_text.loc_message or 'k_plus_tarot'), colour = effect.eval_text.colour or G.C.PURPLE})  
                        end
                    end
                end
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
                },
                func = function(card, context, effect, amount)
                    if context.pre_discard and not context.repetition then
                        if pseudorandom('cj_chance'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal/amount and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local card = SMODS.create_card({set = effect.set, no_edition = true, area = G.consumeables, key_append = 'cj_chance'})
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                    return true
                                end)}))
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize(effect.eval_text.loc_message or 'k_plus_tarot'), colour = effect.eval_text.colour or G.C.PURPLE})  
                        end
                    end
                end
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
                },
                func = function(card, context, effect, amount)
                    if context.pre_discard and not context.repetition then
                        if pseudorandom('cj_chance'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal/amount and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local card = SMODS.create_card({set = effect.set, no_edition = true, area = G.consumeables, key_append = 'cj_chance'})
                                        card:add_to_deck()
                                        G.consumeables:emplace(card)
                                        G.GAME.consumeable_buffer = 0
                                    return true
                                end)}))
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize(effect.eval_text.loc_message or 'k_plus_tarot'), colour = effect.eval_text.colour or G.C.PURPLE})  
                        end
                    end
                end
            },
        }
    },
    [3] = { -- End of Round
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
                amount = { 5, 8, 12, 15},
                func = function(card, context, effect, amount)
                    if context.end_of_round and context.cardarea == G.jokers then
                        ease_dollars(amount)
                        return {
                            message = localize('$')..amount,
                            colour = G.C.MONEY,
                            card = card
                        }
                    end
                end
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
                },
                func = function(card, context, effect, amount)
                    if context.end_of_round and context.cardarea == G.jokers then
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local card = SMODS.create_card({set = effect.set, no_edition = true, area = G.jokers, key_append = 'cj_chance'})
                                        card:add_to_deck()
                                        G.jokers:emplace(card)
                                        G.GAME.joker_buffer = 0
                                    return true
                                end)}))
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize(effect.eval_text.loc_message or 'k_plus_tarot'), colour = effect.eval_text.colour or G.C.PURPLE})  
                        end
                    end
                end
            }
        }
    },
    [4] = { -- First hand played
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
                amount = { 100, 150, 200, 300},
                func = function(card, context, effect, amount)
                    if context.joker_main and G.GAME.current_round.hands_played == 0 then
                        return {
                            message = localize{type='variable',key='a_chips',vars={amount}},
                            chip_mod = amount
                        }
                    end
                end
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                order = 2,
                amount = { 25, 40, 60, 95},
                func = function(card, context, effect, amount)
                    if context.joker_main and G.GAME.current_round.hands_played == 0 then
                        return {
                            message = localize{type='variable',key='a_mult',vars={amount}},
                            mult_mod = amount
                        }
                    end
                end
            },
            [3] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                order = 3,
                min_tier = 2,
                amount = { 2, 3, 5, 8},
                func = function(card, context, effect, amount)
                    if context.joker_main and G.GAME.current_round.hands_played == 0 then
                        return {
                            message = localize{type='variable',key='a_xmult',vars={amount}},
                            Xmult_mod = amount
                        }
                    end
                end
            },
            [4] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 4,
                amount = { 5, 10, 15, 20},
                func = function(card, context, effect, amount)
                    if context.joker_main and G.GAME.current_round.hands_played == 0 then
                        ease_dollars(amount)
                        return {
                            message = localize('$')..amount,
                            colour = G.C.MONEY,
                            card = card
                        }
                    end
                end
            },
        }
    },
    [5] = { -- Last hand played
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
                amount = { 100, 150, 200, 300},
                func = function(card, context, effect, amount)
                    if context.joker_main and G.GAME.current_round.hands_left == 0 then
                        return {
                            message = localize{type='variable',key='a_chips',vars={amount}},
                            chip_mod = amount
                        }
                    end
                end
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                order = 2,
                amount = { 25, 40, 60, 95},
                func = function(card, context, effect, amount)
                    if context.joker_main and G.GAME.current_round.hands_left == 0 then
                        return {
                            message = localize{type='variable',key='a_mult',vars={amount}},
                            mult_mod = amount
                        }
                    end
                end
            },
            [3] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                order = 3,
                min_tier = 2,
                amount = { 2, 3, 5, 8},
                func = function(card, context, effect, amount)
                    if context.joker_main and G.GAME.current_round.hands_left == 0 then
                        return {
                            message = localize{type='variable',key='a_xmult',vars={amount}},
                            Xmult_mod = amount
                        }
                    end
                end
            },
            [4] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 4,
                amount = { 5, 10, 15, 20},
                func = function(card, context, effect, amount)
                    if context.joker_main and G.GAME.current_round.hands_left == 0 then
                        ease_dollars(amount)
                        return {
                            message = localize('$')..amount,
                            colour = G.C.MONEY,
                            card = card
                        }
                    end
                end
            },
        }
    },
    [6] = { -- Each scored card
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
                amount = { 10, 20, 30, 40},
                func = function(card, context, effect, amount)
                    if context.individual and context.cardarea == G.play and not context.repetition then
                        return {
                            message = localize{type='variable',key='a_chips',vars={amount}},
                            chip_mod = amount
                        }
                    end
                end
            },
            [2] = {
                type = "mult",
                loc_key = "cj_effect_mult",
                order = 2,
                amount = { 2, 4, 7, 10},
                func = function(card, context, effect, amount)
                    if context.individual and context.cardarea == G.play and not context.repetition then
                        return {
                            message = localize{type='variable',key='a_mult',vars={amount}},
                            mult_mod = amount
                        }
                    end
                end
            },
            [3] = {
                type = "xmult",
                loc_key = "cj_effect_xmult",
                order = 3,
                min_tier = 2,
                amount = { 0, 1.1, 1.25, 1.5},
                func = function(card, context, effect, amount)
                    if context.individual and context.cardarea == G.play and not context.repetition then
                        return {
                            message = localize{type='variable',key='a_xmult',vars={amount}},
                            Xmult_mod = amount
                        }
                    end
                end
            },
            [4] = {
                type = "dollar",
                loc_key = "cj_effect_dollars",
                order = 4,
                amount = { 1, 2, 3, 4},
                func = function(card, context, effect, amount)
                    if context.individual and context.cardarea == G.play and not context.repetition then
                        ease_dollars(amount)
                        return {
                            message = localize('$')..amount,
                            colour = G.C.MONEY,
                            card = card
                        }
                    end
                end
            },
            [5] = {
                type = "retrigger",
                loc_key = "cj_effect_retrigger",
                order = 5,
                min_tier = 3,
                amount = { 0, 0, 1, 2},
                func = function(card, context, effect, amount)
                    if context.cardarea == G.play and context.repetition then
                        return {
                            message = localize('k_again_ex'),
                            repetitions = amount,
                            card = card
                        }
                    end
                end
            },
        }
    },
}

JokerStudio.addNewCondition = function(new_condition, condition_index)
    if new_condition and condition_index then
        JokerStudio.CustomJokerConditions[condition_index] = new_condition
    else
        if not new_condition then
            sendErrorMessage("JokerStudio.addNewCondition ERROR: Did not receive new condition")
        end
        if not condition_index then
            sendErrorMessage("JokerStudio.addNewCondition ERROR: Did not receive condition index")
        end
    end
end

JokerStudio.addNewEffect = function(new_effect, condition_index, effect_index)
    if new_effect and (condition_index and JokerStudio.CustomJokerConditions[condition_index]) and effect_index then
        JokerStudio.CustomJokerConditions[condition_index].effects[effect_index] = new_effect
    else
        if not new_effect then
            sendErrorMessage("JokerStudio.addNewEffect ERROR: Did not receive new effect")
        end
        if not condition_index then
            sendErrorMessage("JokerStudio.addNewEffect ERROR: Did not receive condition index")
        elseif not JokerStudio.CustomJokerConditions[condition_index] then
            sendErrorMessage("JokerStudio.addNewEffect ERROR: Condition index does not match existing condition")
        end
        if not effect_index then
            sendErrorMessage("JokerStudio.addNewEffect ERROR: Did not receive effect index")
        end
    end
end




local openFiles = {
    "ui.lua",
    "jokers.lua",
    "consumables.lua",
    "decks.lua",
    "vouchers.lua",
    "tags.lua"
}

JokerStudio.reset_game_globals = function(run_start)
    if run_start then
        if JokerStudio.config.run_reset == true then
            ClearCustomJokerData()
        end
    end
end

ValidateCustomJokerFiles = function()
    for i=1,2 do
        if not nfs.getInfo(JokerStudio.path..'assets/'..i..'x/custom') then
            nfs.createDirectory(JokerStudio.path..'assets/'..i..'x/custom')
        end

        for j=1,5 do
            local info = nfs.getInfo(JokerStudio.path..'assets/'..i..'x/custom/joker'..j..'.png')
            if not info or info.size == 0 or info.size == nil then
                local data, size = nfs.read(JokerStudio.path..'assets/'..i..'x/custom_joker_base.png')
                local success, message nfs.write(JokerStudio.path..'assets/'..i..'x/custom/joker'..j..'.png', data)
            end
        end
    end
end

ClearCustomJokerData = function()
    for i=1,2 do
        if nfs.getInfo(JokerStudio.path..'assets/'..i..'x/custom') then
            for j=1,5 do
                if nfs.getInfo(JokerStudio.path..'assets/'..i..'x/custom/joker'..j..'.png') then
                    local was_removed = nfs.remove(JokerStudio.path..'assets/'..i..'x/custom/joker'..j..'.png')
                    if not was_removed then
                        do_restart = false
                        sendErrorMessage("Failed to delete: assets/"..i.."x/custom/joker"..j..".png\nMake sure the file isn't open and try again")
                    end
                end
            end
        end
    end
    for i=1,5 do
        JokerStudio.config.custom_jokers["joker"..i] = {
            in_use = false,
            condition = 0,
            effect = 0
        }
    end
    SMODS.save_mod_config(JokerStudio)

    ValidateCustomJokerFiles()
    ReloadCustomJokerAtlas()
end

ReloadCustomJokerAtlas = function()
    for i=1,5 do 
        G.ASSET_ATLAS["egjs_atlas_custom"..i].image = love.graphics.newImage('/Mods/'..FolderName..'/assets/'..G.SETTINGS.GRAPHICS.texture_scaling..'x/custom/joker'..i..'.png', {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling})
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
