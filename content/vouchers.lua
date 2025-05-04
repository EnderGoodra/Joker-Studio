SMODS.Atlas {
    key = "atlas_voucher",
    path = "vouchers.png",
    px = 71,
    py = 95
}

SMODS.Voucher {
    key = "egjs_license",
    loc_txt = {
        name = "License",
        text = {
            "All received {C:attention}Joker Studio: Basic{}",
            "are instead {C:attention}Joker Studio: Gold{}"
        }
    },
    atlas = "atlas_voucher",
    pos = {x=0,y=0},
    cost = 10,
    redeem = function(self, card)
        G.GAME.js_base = 'c_egjs_js_gold'
    end
}

SMODS.Voucher {
    key = "egjs_upgrade",
    loc_txt = {
        name = "Upgrade",
        text = {
            "All received {C:attention}Joker Studio: Basic{}",
            "are instead {C:attention}Joker Studio: Platinum{}",
            "{C:green}#1# in #2#{} chance for {C:attention}Joker Studio: VIP{}"
        }
    },
    atlas = "atlas_voucher",
    pos = {x=1,y=0},
    cost = 10,
    requires = {
        'v_egjs_license'
    },
    config = { extra = { odds = 8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    redeem = function(self, card)
        G.GAME.js_base = 'c_egjs_js_platinum'
        G.GAME.js_odds = card.ability.extra.odds
    end
}