SMODS.Atlas {
    key = "atlas_back",
    path = "deck.png",
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