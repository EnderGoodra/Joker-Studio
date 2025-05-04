--- ========
---  Jokers
--- ========

--Custom1
SMODS.Atlas {
    key = "atlas_custom1",
    path = "custom/joker1.png",
    px = 71,
    py = 95
}
--Custom2
SMODS.Atlas {
    key = "atlas_custom2",
    path = "custom/joker2.png",
    px = 71,
    py = 95
}
--Custom3
SMODS.Atlas {
    key = "atlas_custom3",
    path = "custom/joker3.png",
    px = 71,
    py = 95
}
--Custom4
SMODS.Atlas {
    key = "atlas_custom4",
    path = "custom/joker4.png",
    px = 71,
    py = 95
}
--Custom5
SMODS.Atlas {
    key = "atlas_custom5",
    path = "custom/joker5.png",
    px = 71,
    py = 95
}
--CustomActive
SMODS.Atlas {
    key = "atlas_custom_active",
    path = "custom/joker1.png",
    px = 71,
    py = 95
}


-- Custom Joker 1
SMODS.Joker {
    key = "egjs_cj_1",
    loc_txt = {
        name = "Custom Joker 1",
        text = { }
    },
    blueprint_compat = true,
    rarity = 1,
    custom_name = "joker1",
    atlas = 'atlas_custom1',
    in_pool = function(self, args)
        return Workshop.config.custom_jokers["joker1"].in_use
    end,
    calculate = function(self, card, context)
        return CustomJokerCalculate("joker1", self, context, card)
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        local target = {
            type = 'descriptions',
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            vars =
                specific_vars or {}
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
        end
        if not full_UI_table.name then
            full_UI_table.name = localize { type = 'name', set = self.set, key = target.key or self.key, nodes = full_UI_table.name }
        end
        if specific_vars and specific_vars.debuffed and not res.replace_debuff then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end
        localize(target)
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end

        local cardData = Workshop.config.custom_jokers[self.custom_name]
        if cardData.in_use == true then
            local _conKey, _effectKey, _amountVar, _colVar = GetUIDescriptions(cardData)
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1), colours = {_colVar or nil}}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}
-- Custom Joker 2
SMODS.Joker {
    key = "egjs_cj_2",
    loc_txt = {
        name = "Custom Joker 2",
        text = {}
    },
    blueprint_compat = true,
    rarity = 1,
    custom_name = "joker2",
    atlas = 'atlas_custom2',
    in_pool = function(self, args)
        return Workshop.config.custom_jokers["joker2"].in_use
    end,
    calculate = function(self, card, context)
        return CustomJokerCalculate("joker2", self, context, card)
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        local target = {
            type = 'descriptions',
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            vars =
                specific_vars or {}
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
        end
        if not full_UI_table.name then
            full_UI_table.name = localize { type = 'name', set = self.set, key = target.key or self.key, nodes = full_UI_table.name }
        end
        if specific_vars and specific_vars.debuffed and not res.replace_debuff then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end
        localize(target)
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end

        local cardData = Workshop.config.custom_jokers[self.custom_name]
        if cardData.in_use == true then
            local _conKey, _effectKey, _amountVar, _colVar = GetUIDescriptions(cardData)
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1), colours = {_colVar or nil}}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}
-- Custom Joker 3
SMODS.Joker {
    key = "egjs_cj_3",
    loc_txt = {
        name = "Custom Joker 3",
        text = {}
    },
    blueprint_compat = true,
    rarity = 1,
    custom_name = "joker3",
    atlas = 'atlas_custom3',
    in_pool = function(self, args)
        return Workshop.config.custom_jokers["joker3"].in_use
    end,
    calculate = function(self, card, context)
        return CustomJokerCalculate("joker3", self, context, card)
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        local target = {
            type = 'descriptions',
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            vars =
                specific_vars or {}
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
        end
        if not full_UI_table.name then
            full_UI_table.name = localize { type = 'name', set = self.set, key = target.key or self.key, nodes = full_UI_table.name }
        end
        if specific_vars and specific_vars.debuffed and not res.replace_debuff then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end
        localize(target)
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end

        local cardData = Workshop.config.custom_jokers[self.custom_name]
        if cardData.in_use == true then
            local _conKey, _effectKey, _amountVar, _colVar = GetUIDescriptions(cardData)
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1), colours = {_colVar or nil}}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}
-- Custom Joker 4
SMODS.Joker {
    key = "egjs_cj_4",
    loc_txt = {
        name = "Custom Joker 4",
        text = {}
    },
    blueprint_compat = true,
    rarity = 1,
    custom_name = "joker4",
    atlas = 'atlas_custom4',
    in_pool = function(self, args)
        return Workshop.config.custom_jokers["joker4"].in_use
    end,
    calculate = function(self, card, context)
        return CustomJokerCalculate("joker4", self, context, card)
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        local target = {
            type = 'descriptions',
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            vars =
                specific_vars or {}
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
        end
        if not full_UI_table.name then
            full_UI_table.name = localize { type = 'name', set = self.set, key = target.key or self.key, nodes = full_UI_table.name }
        end
        if specific_vars and specific_vars.debuffed and not res.replace_debuff then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end
        localize(target)
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end

        local cardData = Workshop.config.custom_jokers[self.custom_name]
        if cardData.in_use == true then
            local _conKey, _effectKey, _amountVar, _colVar = GetUIDescriptions(cardData)
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1), colours = {_colVar or nil}}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}
-- Custom Joker 5
SMODS.Joker {
    key = "egjs_cj_5",
    loc_txt = {
        name = "Custom Joker 5",
        text = {}
    },
    blueprint_compat = true,
    rarity = 1,
    custom_name = "joker5",
    atlas = 'atlas_custom5',
    in_pool = function(self, args)
        return Workshop.config.custom_jokers["joker5"].in_use
    end,
    calculate = function(self, card, context)
        return CustomJokerCalculate("joker5", self, context, card)
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        local target = {
            type = 'descriptions',
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            vars =
                specific_vars or {}
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
        end
        if not full_UI_table.name then
            full_UI_table.name = localize { type = 'name', set = self.set, key = target.key or self.key, nodes = full_UI_table.name }
        end
        if specific_vars and specific_vars.debuffed and not res.replace_debuff then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end
        localize(target)
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end

        local cardData = Workshop.config.custom_jokers[self.custom_name]
        if cardData.in_use == true then
            local _conKey, _effectKey, _amountVar, _colVar = GetUIDescriptions(cardData)
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1), colours = {_colVar or nil}}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}

GetUIDescriptions = function(card_data)
    local _condition = CustomJokerConditions[card_data.condition] or nil
    local _effect = _condition and _condition.effects[card_data.effect] or nil
    local _conKey = (_condition and _condition.loc_key) or 'cj_condition_nil'
    local _effectKey = _effect and ((_effect.dependency and (next(SMODS.find_mod(_effect.dependency)) and (_effect.loc_key or 'cj_effect_nil') or _effect.missing_loc_key)) or _effect.loc_key or 'cj_effect_nil')
    local _amountVar = _effect and _effect.amount[card_data.tier] or 0
    local _colVar = _effect and _effect.loc_col and _effect.loc_col[card_data.tier] or nil
    return _conKey, _effectKey, _amountVar, _colVar
end


CustomJokerCalculate = function(id, slf, context, card)
    local card_data = Workshop.config.custom_jokers[id]
    if card_data.in_use == true and card_data.condition ~= 0 and card_data.effect ~= 0 then
        local _con = CustomJokerConditions[card_data.condition]
        local effect = _con.effects[card_data.effect] or nil
        local amount = (effect and effect.amount[card_data.tier]) or nil
        if effect ~= nil and amount ~= nil then
            if context.repetition then
                if _con.type == "scoring_cards" and effect.type == "retrigger"  then
                return {
                    message = localize('k_again_ex'),
                    repetitions = amount,
                    card = card
                }
                end
            else
                if (_con.type == "scoring_cards" and context.individual and context.cardarea == G.play)
            or (_con.type == "joker_main" and context.joker_main)
            or (_con.type == "first_hand" and context.joker_main and G.GAME.current_round.hands_played == 0)
            or (_con.type == "last_hand" and context.joker_main and G.GAME.current_round.hands_left == 0) then
                if effect.type == "chips"  then
                    return {
                        message = localize{type='variable',key='a_chips',vars={amount}},
                        chip_mod = amount
                    }
                elseif effect.type == "mult" then
                    return {
                        message = localize{type='variable',key='a_mult',vars={amount}},
                        mult_mod = amount
                    }
                elseif effect.type == "xmult" then
                    return {
                        message = localize{type='variable',key='a_xmult',vars={amount}},
                        Xmult_mod = amount
                    }
                elseif effect.type == "dollar" then
                    ease_dollars(amount)
                    return {
                        message = localize('$')..amount,
                        colour = G.C.MONEY,
                        card = card
                    }
                end
                end
                if (_con.type == "round_end" and context.end_of_round and context.cardarea == G.jokers) then
                    if effect.type == "dollar" then
                        ease_dollars(amount)
                        return {
                            message = localize('$')..amount,
                            colour = G.C.MONEY,
                            card = card
                        }
                    elseif effect.type == "card_create" then
                        local area = (effect.set == "Joker" and G.jokers) or G.consumeables
                        if area == G.consumables and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
                        or area == G.jokers and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            if area == G.consumables then G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            elseif area == G.jokers then G.GAME.joker_buffer = G.GAME.joker_buffer + 1 end
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = (function()
                                        local card = SMODS.create_card({set = effect.set, rarity = (amount == "uncommon" and 0.8) or (amount == "rare" and 1) or 0.5})
                                        --local card = create_card(effect.set,area, nil, nil, nil, nil, nil, 'cj_create')
                                        card:add_to_deck()
                                        area:emplace(card)
                                        if area == G.consumables then G.GAME.consumeable_buffer = 0
                                        elseif area == G.jokers then G.GAME.joker_buffer = 0 end
                                    return true
                                end)}))
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize(effect.eval_text and effect.eval_text.loc_message or 'k_plus_tarot'), colour = effect.eval_text and effect.eval_text.colour or G.C.PURPLE})  
                        end
                    end
                end
                if (_con.type == "hand_discard" and context.pre_discard) then
                    if effect.type == "dollar" then
                        ease_dollars(amount)
                        return {
                            message = localize('$')..amount,
                            colour = G.C.MONEY,
                            card = card
                        }
                    elseif effect.type == "card_chance" then
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
            end
        end
    return nil
    else
        return nil
    end
end