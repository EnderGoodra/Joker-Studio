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
        return JokerStudio.config.custom_jokers["joker1"].in_use
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

        local cardData = JokerStudio.config.custom_jokers[self.custom_name]
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
        return JokerStudio.config.custom_jokers["joker2"].in_use
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

        local cardData = JokerStudio.config.custom_jokers[self.custom_name]
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
        return JokerStudio.config.custom_jokers["joker3"].in_use
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

        local cardData = JokerStudio.config.custom_jokers[self.custom_name]
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
        return JokerStudio.config.custom_jokers["joker4"].in_use
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

        local cardData = JokerStudio.config.custom_jokers[self.custom_name]
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
        return JokerStudio.config.custom_jokers["joker5"].in_use
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

        local cardData = JokerStudio.config.custom_jokers[self.custom_name]
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
    local _condition = JokerStudio.CustomJokerConditions[card_data.condition] or nil
    local _effect = _condition and _condition.effects[card_data.effect] or nil
    local _conKey = (_condition and _condition.loc_key) or 'cj_condition_nil'
    local _effectKey = _effect and ((_effect.dependency and (next(SMODS.find_mod(_effect.dependency)) and (_effect.loc_key or 'cj_effect_nil') or _effect.missing_loc_key)) or _effect.loc_key or 'cj_effect_nil') or 'cj_effect_nil'
    local _amountVar = _effect and _effect.amount[card_data.tier] or 0
    local _colVar = _effect and _effect.loc_col and _effect.loc_col[card_data.tier] or nil
    return _conKey, _effectKey, _amountVar, _colVar
end


CustomJokerCalculate = function(id, slf, context, card)
    local card_data = JokerStudio.config.custom_jokers[id]
    if card_data.in_use == true and card_data.condition ~= 0 and card_data.effect ~= 0 then
        local _con = JokerStudio.CustomJokerConditions[card_data.condition]
        local effect = _con.effects[card_data.effect] or nil
        local amount = (effect and effect.amount[card_data.tier]) or nil
        if effect ~= nil and amount ~= nil then
            return effect.func(card, context, effect, amount)
        end
    end
    return nil
end