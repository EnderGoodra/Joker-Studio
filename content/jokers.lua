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
    key = "egwork_cj_1",
    loc_txt = {
        name = "Custom Joker 1",
        text = { }
    },
    rarity = 1,
    custom_name = "joker1",
    atlas = 'atlas_custom1',
    in_pool = function(self, args)
        return false
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
            local _conKey = CustomJokerConditions[cardData.condition].loc_key or 'cj_condition_nil'
            local _effectKey = CustomJokerConditions[cardData.condition].effects[cardData.effect].loc_key or 'cj_effect_nil'
            local _amountVar = CustomJokerConditions[cardData.condition].effects[cardData.effect].amount[cardData.tier] or 0
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1)}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}
-- Custom Joker 2
SMODS.Joker {
    key = "egwork_cj_2",
    loc_txt = {
        name = "Custom Joker 2",
        text = {}
    },
    rarity = 1,
    custom_name = "joker2",
    atlas = 'atlas_custom2',
    in_pool = function(self, args)
        return false
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
            local _conKey = CustomJokerConditions[cardData.condition].loc_key or 'cj_condition_nil'
            local _effectKey = CustomJokerConditions[cardData.condition].effects[cardData.effect].loc_key or 'cj_effect_nil'
            local _amountVar = CustomJokerConditions[cardData.condition].effects[cardData.effect].amount[cardData.tier] or 0
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1)}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}
-- Custom Joker 3
SMODS.Joker {
    key = "egwork_cj_3",
    loc_txt = {
        name = "Custom Joker 3",
        text = {}
    },
    rarity = 1,
    custom_name = "joker3",
    atlas = 'atlas_custom3',
    in_pool = function(self, args)
        return false
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
            local _conKey = CustomJokerConditions[cardData.condition].loc_key or 'cj_condition_nil'
            local _effectKey = CustomJokerConditions[cardData.condition].effects[cardData.effect].loc_key or 'cj_effect_nil'
            local _amountVar = CustomJokerConditions[cardData.condition].effects[cardData.effect].amount[cardData.tier] or 0
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1)}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}
-- Custom Joker 4
SMODS.Joker {
    key = "egwork_cj_4",
    loc_txt = {
        name = "Custom Joker 4",
        text = {}
    },
    rarity = 1,
    custom_name = "joker4",
    atlas = 'atlas_custom4',
    in_pool = function(self, args)
        return false
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
            local _conKey = CustomJokerConditions[cardData.condition].loc_key or 'cj_condition_nil'
            local _effectKey = CustomJokerConditions[cardData.condition].effects[cardData.effect].loc_key or 'cj_effect_nil'
            local _amountVar = CustomJokerConditions[cardData.condition].effects[cardData.effect].amount[cardData.tier] or 0
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1)}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}
-- Custom Joker 5
SMODS.Joker {
    key = "egwork_cj_5",
    loc_txt = {
        name = "Custom Joker 5",
        text = {}
    },
    rarity = 1,
    custom_name = "joker5",
    atlas = 'atlas_custom5',
    in_pool = function(self, args)
        return false
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
            local _conKey = CustomJokerConditions[cardData.condition].loc_key or 'cj_condition_nil'
            local _effectKey = CustomJokerConditions[cardData.condition].effects[cardData.effect].loc_key or 'cj_effect_nil'
            local _amountVar = CustomJokerConditions[cardData.condition].effects[cardData.effect].amount[cardData.tier] or 0
    
            localize{type = 'other', key = _conKey, nodes = desc_nodes, vars = {}}
            localize{type = 'other', key = _effectKey, nodes = desc_nodes, vars = {_amountVar or 1, (G.GAME and G.GAME.probabilities.normal or 1)}}
            localize{type = 'other', key = "js_tier"..cardData.tier, nodes = desc_nodes, vars = {}}
            
        else
            localize{type = 'other', key = 'cj_not_created', nodes = desc_nodes, vars = {}}
        end
    end
}


CustomJokerCalculate = function(id, slf, context, card)
    local card_data = Workshop.config.custom_jokers[id]
    if card_data.in_use == true and card_data.condition ~= 0 and card_data.effect ~= 0 then
        local _con = CustomJokerConditions[card_data.condition]
        if card_data.condition == 1 and context.joker_main then return CustomJokerEffect(_con.effects, card_data, context, card) end
        if card_data.condition == 2 and context.pre_discard then return CustomJokerEffect(_con.effects, card_data, context, card) end
    else
        return nil
    end
end

CustomJokerEffect = function(effects, cardData, context, card)
    local effect = effects[cardData.effect] or nil
    local amount = (effect and effect.amount[cardData.tier]) or nil
    if effect ~= nil and amount ~= nil then
        print(amount)
        if effect.type == "chips" then
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
            if context.joker_main or context.pre_discard then
                ease_dollars(amount)
                return {
                    message = localize('$')..amount,
                    colour = G.C.MONEY,
                    card = card
                }
            end
        elseif effect.type == "card_tarot" then
            if pseudorandom('cj_tarot'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal/amount then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'cj_tarot')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})  
            end
        elseif effect.type == "card_planet" then
            if pseudorandom('cj_planet'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal/amount then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'cj_planet')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet})
            end
        elseif effect.type == "card_spectral" then
            if pseudorandom('cj_spectral'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal/amount then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'cj_spectral')
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
            end
        end
    end
    return nil
end