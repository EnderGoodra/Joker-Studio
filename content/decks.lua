SMODS.Atlas {
    key = "atlas_back",
    path = "deck.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "atlas_sleeve",
    path = "sleeve.png",
    px = 71,
    py = 95
}

SMODS.Back {
    key = 'egjs_jimbos_deck',
    loc_txt = {
        name = 'JimbOS Deck',
        text = {
            'Gain a {C:attention,T:c_egjs_js_basic}Joker Studio: Basic{}',
            'after each {C:attention}Boss Blind{}',
            'Start with {C:attention,T:v_egjs_license}Licence{} voucher',
        }
    },
    config = { voucher = 'v_egjs_license' },
    -- loc_vars = function(self, info_queue, back)
    --     info_queue[#info_queue+1] = { set = "egjs_designer", key = "c_egjs_js_basic" }
    --     return { vars = { } }
    -- end,
    atlas = 'atlas_back',
    -- apply = function(self, back)
    --     G.GAME.used_vouchers[] = true
    --     G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
    --     Card.apply_to_run(nil, G.P_CENTERS['v_egjs_license'])
    -- end,
    calculate = function (self, back, context)
        if context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
            CreateJSCard(G.consumeables, 1, nil, nil)
        end
    end
}

if CardSleeves then
    CardSleeves.Sleeve {
        key = "jimbos_sleeve",
        loc_txt = {
            name = "JimbOS Sleeve",
            text = { "{C:blue}+#1#{} hand", "every round" }
        },
        loc_vars = function(self)
            local key, vars
            if self.get_current_deck_key() == "b_egjs_jimbos_deck" then
                key = self.key .. "_alt"
                self.config = { voucher = 'v_egjs_upgrade', give_card = false }
                vars = { }
            else
                key = self.key
                self.config = { voucher = 'v_egjs_license', give_card = true }
                vars = { }
            end
            return { key = key, vars = vars }
        end,
        atlas = "atlas_sleeve",
        pos = {x = 0, y = 0},
        unlocked = false,
        unlock_condition = {deck = "b_egjs_jimbos_deck", stake = "stake_black"},
        calculate = function (self, sleeve, context)
            if sleeve.config.give_card and context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
                CreateJSCard(G.consumeables, 1, nil, nil)
            end
        end
    }
end