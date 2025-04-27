--- ================
---  Card Modifiers
--- ================

SMODS.Atlas {
    key = "atlas_tags",
    path = "tags.png",
    px = 34,
    py = 34
}


SMODS.Tag {
    key = 'egwork_editor',
    loc_txt = {
        name = 'Editor Tag',
        text = {
            "Gives a free",
            "{C:attention}Joker Studio: Basic{}"
        },
    },
    atlas = 'atlas_tags',
    pos = { x = 0, y = 0 },
    apply = function(self, tag, context)
        CreateJSCard(G.consumeables, 1, nil, nil)
        tag:yep("Basic", G.C.SPECTRAL, function() return true end )
        tag.triggered = true
    end,
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue+1] = G.P_CENTERS["c_egwork_js_basic"]
        return { vars = {  } }
    end,
}

-- SMODS.Tag {
--     key = 'egwork_trial',
--     loc_txt = {
--         name = 'Demo Tag',
--         text = {
--             "Gives a free {C:attention}trial{}",
--             "{C:attention}Joker Studio: Gold{}"
--         },
--     },
--     atlas = 'atlas_tags',
--     pos = { x = 1, y = 0 },
--     apply = function(self, tag, context)
--         CreateJSCard(G.consumeables, 1, nil, 'c_egwork_js_gold', {"egwork_trial_sticker"})
--         tag:yep("Gold", G.C.MONEY, function() return true end )
--         tag.triggered = true
--     end,
--     loc_vars = function(self, info_queue, tag)
--         info_queue[#info_queue+1] = G.P_CENTERS["c_egwork_js_gold"]
--         return { vars = {  } }
--     end,
-- }

-- SMODS.Tag {
--     key = 'egwork_cracked',
--     loc_txt = {
--         name = 'Cracked Tag',
--         text = {
--             "Gives a free {C:attention}pirated{}",
--             "{C:attention}Joker Studio: Platinum{}"
--         },
--     },
--     atlas = 'atlas_tags',
--     pos = { x = 2, y = 0 },
--     apply = function(self, tag, context)
--         CreateJSCard(G.consumeables, 1, nil, 'c_egwork_js_platinum', {"egwork_pirated_sticker"})
--         tag:yep("Platinum", G.C.PLANET, function() return true end )
--         tag.triggered = true
--     end,
--     loc_vars = function(self, info_queue, tag)
--         info_queue[#info_queue+1] = G.P_CENTERS["c_egwork_js_platinum"]
--         return { vars = {  } }
--     end,
-- }