--- =============
---  Consumables
--- =============
local NFS = require("nativefs")

SMODS.Atlas {
    key = "atlas_consumable",
    path = "joker_studio.png",
    px = 71,
    py = 95
}

SMODS.ConsumableType {
    key = 'studio',
    primary_colour = HEX('FFFFFF'),
    secondary_colour = HEX('888888'),
    loc_txt = {
        name = 'Studio', -- used on card type badges
        collection = 'Studio Cards', -- label for the button to access the collection
        undiscovered = { -- description for undiscovered cards in the collection
            name = 'Placeholder',
            text = { 'Placeholder' },
        },
    },
    shop_rate = 0
    
}

--Basic
SMODS.Consumable {
    key = 'egjs_js_basic',
    set = 'studio',
    loc_txt = {
        name = "Joker Studio: Basic",
        text = {
            "When used, opens the basic",
            "{s:1.4,E:1,C:attention}Joker Studio",
            "{C:inactive}(Must a Joker slot free){}",
        }
    },
    atlas = 'atlas_consumable',
    pos = {x=0,y=0},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = "js_basic_def", set = "Other"}
        return { vars = { } }
    end,
    can_use = function(self, card)
        return (#G.jokers.cards < G.jokers.config.card_limit)
    end,
    use = function(self, card, area, copier)
        G.JM_MODIFIER = nil
        G.JM_SELECT = 1
        G.JM_TIER = 1
        G.JM_MENU = UIBox({
			definition = create_UIBox_JM_menu(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
        G.JM_MENU.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.JM_MENU:align_to_major()
    end,
}
--Gold
SMODS.Consumable {
    key = 'egjs_js_gold',
    set = 'studio',
    loc_txt = {
        name = "Joker Studio: Gold",
        text = {
            "When used, opens the {C:money}Gold{}",
            "{s:1.4,E:1,C:attention}Joker Studio",
            "{C:inactive}(Must a Joker slot free){}",
        }
    },
    atlas = 'atlas_consumable',
    pos = {x=1,y=0},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = "js_gold_def", set = "Other"}
        return { vars = { } }
    end,
    can_use = function(self, card)
        return (#G.jokers.cards < G.jokers.config.card_limit)
    end,
    use = function(self, card, area, copier)
        G.JM_MODIFIER = nil
        G.JM_SELECT = 1
        G.JM_TIER = 2
        G.JM_MENU = UIBox({
			definition = create_UIBox_JM_menu(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
        G.JM_MENU.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.JM_MENU:align_to_major()
    end,
}
--Platinum
SMODS.Consumable {
    key = 'egjs_js_platinum',
    set = 'studio',
    loc_txt = {
        name = "Joker Studio: Platinum",
        text = {
            "When used, opens the {C:planet}Platinum{}",
            "{s:1.4,E:1,C:attention}Joker Studio",
            "{C:inactive}(Must a Joker slot free){}",
        }
    },
    atlas = 'atlas_consumable',
    pos = {x=2,y=0},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = "js_platinum_def", set = "Other"}
        return { vars = { } }
    end,
    can_use = function(self, card)
        return (#G.jokers.cards < G.jokers.config.card_limit)
    end,
    use = function(self, card, area, copier)
        G.JM_MODIFIER = nil
        G.JM_SELECT = 1
        G.JM_TIER = 3
        G.JM_MENU = UIBox({
			definition = create_UIBox_JM_menu(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
        G.JM_MENU.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.JM_MENU:align_to_major()
    end,
}
--VIP
SMODS.Consumable {
    key = 'egjs_js_vip',
    set = 'studio',
    loc_txt = {
        name = "Joker Studio: VIP",
        text = {
            "When used, opens the {C:dark_edition,E:1}VIP{}",
            "{s:1.4,E:1,C:attention}Joker Studio",
            "{C:inactive}(Must a Joker slot free){}",
        }
    },
    atlas = 'atlas_consumable',
    pos = {x=3,y=0},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = "js_vip_def", set = "Other"}
        return { vars = { } }
    end,
    can_use = function(self, card)
        return (#G.jokers.cards < G.jokers.config.card_limit)
    end,
    use = function(self, card, area, copier)
        G.JM_MODIFIER = nil
        G.JM_SELECT = 1
        G.JM_TIER = 4
        G.JM_MENU = UIBox({
			definition = create_UIBox_JM_menu(card),
			config = {
				align = "cm",
				offset = { x = 0, y = 10 },
				major = G.ROOM_ATTACH,
				bond = "Weak",
				instance_type = "POPUP",
			},
		})
        G.JM_MENU.alignment.offset.y = 0
		G.ROOM.jiggle = G.ROOM.jiggle + 1
		G.JM_MENU:align_to_major()
    end,
}


CreateJSCard = function(area, quantity, force_spawn, force_key, stickers)
    local _key = force_key or nil
    if _key == nil then
        if G.GAME.js_odds and pseudorandom('js_roll') < (G.GAME and G.GAME.probabilities.normal or 1)/G.GAME.js_odds then
            _key = "c_egjs_js_vip"
        elseif G.GAME.js_base then
            _key = G.GAME.js_base
        else
            _key = "c_egjs_js_basic"
        end
    end

    for i = 1, (force_spawn and quantity) or math.min(quantity, area.config.card_limit - #area.cards) do
        local selected_card = SMODS.create_card({set = "studio", key = _key, no_edition = true, skip_materialize = false, stickers = stickers or nil})
        selected_card:add_to_deck()
        area:emplace(selected_card)
    end
end


-- --Cracked
-- SMODS.Consumable {
--     key = 'egjs_js_trial',
--     set = 'studio',
--     loc_txt = {
--         name = "Joker Studio: Trial",
--         text = {
--             "When used, opens the {C:dark_edition,E:1}VIP{}",
--             "{s:1.4,E:1,C:attention}Joker Studio",
--             "{C:inactive}(Must a Joker slot free){}",
--         }
--     },
--     atlas = 'atlas_consumable',
--     pos = {x=3,y=0},
--     loc_vars = function(self, info_queue, card)
--         info_queue[#info_queue+1] = {key = "js_vip_def", set = "Other"}
--         info_queue[#info_queue+1] = {key = "js_trial_def", set = "Other"}
--         info_queue[#info_queue+1] = { set = "Other", key = "perishable", specific_vars = { 5, 5 } }
--         return { vars = { } }
--     end,
--     can_use = function(self, card)
--         return (#G.jokers.cards < G.jokers.config.card_limit)
--     end,
--     use = function(self, card, area, copier)
--         G.JM_MODIFIER = "perishable"
--         G.JM_SELECT = 1
--         G.JM_TIER = 4
--         G.JM_MENU = UIBox({
-- 			definition = create_UIBox_JM_menu(card),
-- 			config = {
-- 				align = "cm",
-- 				offset = { x = 0, y = 10 },
-- 				major = G.ROOM_ATTACH,
-- 				bond = "Weak",
-- 				instance_type = "POPUP",
-- 			},
-- 		})
--         G.JM_MENU.alignment.offset.y = 0
-- 		G.ROOM.jiggle = G.ROOM.jiggle + 1
-- 		G.JM_MENU:align_to_major()
--     end,
-- }
