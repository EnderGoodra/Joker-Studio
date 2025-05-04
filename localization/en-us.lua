return {
    descriptions = {
		Other = {
            cj_not_created = {
                name = "Not Created",
                text = {
                    "{C:inactive}No effect yet!",
                    "{C:inactive,E:1}What will it do???"
                }
            },

            cj_condition_nil = {
                name = "Condition",
                text = {
                    "When {E:1}???{},",
                }
            },

            cj_condition_joker_main = {
                name = "Condition",
                text = {
                    "When this {C:attention}Joker{} scores,",
                }
            },
            cj_condition_hand_discard = {
                name = "Condition",
                text = {
                    "When hand is discarded,",
                }
            },
            cj_condition_round_end = {
                name = "Condition",
                text = {
                    "At end of round,",
                }
            },
            cj_condition_first_hand = {
                name = "Condition",
                text = {
                    "If first hand of round,",
                }
            },
            cj_condition_last_hand = {
                name = "Condition",
                text = {
                    "If last hand of round,",
                }
            },
            cj_condition_scoring_cards = {
                name = "Condition",
                text = {
                    "Each scored card",
                }
            },

            cj_effect_nil = {
                name = "Effect",
                text = {
                    "gives {E:1}???{}",
                }
            },

            cj_effect_chips = {
                name = "Effect",
                text = {
                    "gives {C:chips}+#1#{} Chips",
                }
            },
            cj_effect_mult = {
                name = "Effect",
                text = {
                    "gives {C:mult}+#1#{} Mult",
                }
            },
            cj_effect_xmult = {
                name = "Effect",
                text = {
                    "gives {X:mult,C:white}X#1#{} Mult",
                }
            },
            cj_effect_dollars = {
                name = "Effect",
                text = {
                    "gives {C:money}$#1#{}",
                }
            },
            cj_effect_retrigger = {
                name = "Effect",
                text = {
                    "retriggers {C:attention}#1#{} time(s)",
                }
            },

            cj_effect_tarot_chance = {
                name = "Effect",
                text = {
                    "{C:green}#2# in #1#{} chance to give a {C:tarot}Tarot{} card",
                }
            },
            cj_effect_planet_chance = {
                name = "Effect",
                text = {
                    "{C:green}#2# in #1#{} chance to give a {C:planet}Planet{} card",
                }
            },
            cj_effect_spectral_chance = {
                name = "Effect",
                text = {
                    "{C:green}#2# in #1#{} chance to give a {C:spectral}Spectral{} card",
                }
            },
            cj_effect_mf_colour_chance = {
                name = "Effect",
                text = {
                    "{C:green}#2# in #1#{} chance to give a {C:colourcard}Colour{} card",
                }
            },

            cj_effect_joker_create = {
                name = "Effect",
                text = {
                    "create a random {V:1}#1#{} Joker",
                }
            },


            cj_missing_mod = {
                name = "Effect",
                text = {
                    "{C:mult}ERROR | Mod not Found: #1#",
                }
            },

            js_tier1 = {
                name = "Basic Tier",
                text = {
                    "{s:0.9}Tier: Basic"
                }
            },
            js_tier2 = {
                name = "Gold Tier",
                text = {
                    "{s:0.9}Tier: {C:money}Gold"
                }
            },
            js_tier3 = {
                name = "Platinum Tier",
                text = {
                    "{s:0.9}Tier: {C:planet}Platinum"
                }
            },
            js_tier4 = {
                name = "VIP Tier",
                text = {
                    "{s:0.9}Tier: {C:dark_edition,E:1}VIP"
                }
            },

            js_basic_def = {
                name = "Basic Tier",
                text = {
                    "Jokers created with",
                    "this tier will have",
                    "lower values"
                }
            },
            js_gold_def = {
                name = "Gold Tier",
                text = {
                    "Jokers created with",
                    "this tier will have",
                    "moderate values"
                }
            },
            js_platinum_def = {
                name = "Platinum Tier",
                text = {
                    "Jokers created with",
                    "this tier will have",
                    "higher values"
                }
            },
            js_vip_def = {
                name = "VIP Tier",
                text = {
                    "Jokers created with",
                    "this tier will have",
                    "very high values"
                }
            },
            js_trial_def = {
                name = "Free Trial",
                text = {
                    "Jokers added to your",
                    "run with this trial",
                    "will be {C:attention}perishable{}"
                }
            },
		},
        Sleeve = {
            sleeve_egjs_jimbos_sleeve = {
                name = "JimbOS Sleeve",
                text = {
                    'Gain a {C:attention,T:c_egjs_js_basic}Joker Studio: Basic{}',
                    'after each {C:attention}Boss Blind{}',
                    'Start with {C:attention,T:v_egjs_license}Licence{} voucher',
                }
            },
            sleeve_egjs_jimbos_sleeve_alt = {
                name = "JimbOS Sleeve",
                text = {
                    'Start with {C:attention,T:v_egjs_upgrade}Upgrade{} voucher',
                }
            }
        }
    },
    misc = {
        dictionary = {
            conf_palette_lock = "Palette Lock",
            conf_palette_lock_desc = {
                "Lower tier Joker Studio",
                "editors have fewer colours"
            },
            conf_run_reset = "Reset each Run",
            conf_run_reset_desc = {
                "Custom Joker data is reset",
                "when starting a new run",
                "(Disabling this may be unbalanced)"
            },
        }
    }
}