local enhanced_ectoplasm_use = 3
local ultra_enhanced_ectoplasm_use = 10

local random_editions = {
	'foil',
	'holo',
	'polychrome',
	'cry_mosaic',
	'cry_astral',
	'cry_blur'
}

local enhancedspectrals = {
    object_type = "ConsumableType",
    key = "Enhancedspectrals",
    primary_colour = HEX("D019E9"),
    secondary_colour = HEX("19E9E9"),
    collection_rows = {4,5}, -- 4 pages for all code cards
    loc_txt = {
        collection = "Enhanced Spectral Cards",
        name = "Enhanced Spectrals",
        label = "Enhanced Spectrals"
    },
    shop_rate = 0,
    default = 'c_analog_ex',
    can_stack = true,
    can_divide = true
}
local enhancedspectrals_atlas = {
    object_type = "Atlas",
    key = "enhanced",
    path = "EnhancedTarots.png",
    px = 71,
    py = 95
}
local ultraenhancedspectrals_atlas = {
    object_type = "Atlas",
    key = "ultraenhanced",
    path = "UltraEnhancedTarots.png",
    px = 71,
    py = 95
}

-- ENHANCED SPECTRAL CARDS

local aura = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Enhancedaura",
    key = "c_aura",
    pos = {x=4,y=4},
	config = {},
    loc_txt = {
        name = 'Enhanced Aura',
        text = {
			"Highlight {C:attention}1 to 2{} playable cards and",
            "set a random {C:dark_edition}edition{} on these cards",
	    "{C:inactive}(foil, holographic, polychrome, mosaic, astral, blurred){}"
        }
    },
    cost = 20,
    atlas = "enhanced",
    can_use = function(self, card)
        return #G.hand.highlighted >= 1 and #G.hand.highlighted <= 2
    end,
    use = function(self, card, area, copier)
	for i = 1, #G.hand.highlighted do
	    G.hand.highlighted[i]:set_edition({[random_editions[pseudorandom('disc1', 1, #random_editions)]] = true}, true, true)
	end
    end
}

local ectoplasm = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Enhancedectoplasm",
    key = "c_ectoplasm",
    pos = {x=8,y=4},
	config = {},
    loc_txt = {
        name = 'Enhanced Ectoplasm',
        text = {
			"Choose one jokers, and set {C:dark_edition}negative{}",
            "edition on this joker. Usable {C:attention}3{} times."
        }
    },
    cost = 20,
    atlas = "enhanced",
    can_use = function(self, card)
        return #G.jokers.highlighted == 1
    end,
    use = function(self, card, area, copier)
        G.jokers.highlighted[1]:set_edition({
            negative = true
            	})
	enhanced_ectoplasm_use = enhanced_ectoplasm_use - 1
	if enhanced_ectoplasm_use ~= 0 then
	    local card = create_card('Enhancedspectrals', G.consumeables, nil,  nil, nil, nil, 'c_oiim_c_ectoplasm', 'Enhancedectoplasm')
	    card:add_to_deck()
	    G.consumeables:emplace(card)
	elseif enhanced_ectoplasm_use == 0 then
	    enhanced_ectoplasm_use = 3
	end
    end
}

local cryptid = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Enhancedcryptid",
    key = "c_cryptid",
    pos = {x=5,y=5},
	config = {},
    loc_txt = {
        name = 'Enhanced Cryptid',
        text = {
			"Choose {C:attention}2{} playing cards, and",
            "create {C:attention}4{} copies of these cards"
        }
    },
    cost = 20,
    atlas = "enhanced",
    can_use = function(self, card)
        return #G.hand.highlighted == 2
    end,
    use = function(self, card, area, copier)
	for i = 1, 2 do
	    for k = 1, 4 do
                local card = copy_card(G.hand.highlighted[i])
                card:start_materialize()
                card:add_to_deck()
                G.hand:emplace(card)
	    end
	end
    end
}

local quasar = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Quasar",
    key = "c_cry_white_hole",
    pos = {x=0,y=0},
    loc_txt = {
        name = 'Quasar',
        text = { "{C:attention}Remove{} all hand levels,",
        "upgrade {C:legendary,E:1}most played{} poker hand",
        "by {C:attention}10{} for each removed level"
        }
    },
    cost = 45,
    atlas = "quasar",
    hidden = true, --default soul_rate of 0.3% in spectral packs is used
    soul_set = "Planet",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        --Get most played hand type (logic yoinked from Telescope)
        local _planet, _hand, _tally = nil, nil, -1
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                _hand = v
                _tally = G.GAME.hands[v].played
            end
        end
        if _hand then
            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        local removed_levels = 0
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].level > 1 then
                local this_removed_levels = G.GAME.hands[v].level - 1
                removed_levels = removed_levels + this_removed_levels
                level_up_hand(card, v, true, -this_removed_levels)
            end
        end
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_hand, 'poker_hands'),chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level=G.GAME.hands[_hand].level})
        level_up_hand(card, _hand, false, 10*removed_levels)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end,
    --Incantation compat
    can_stack = true,
    can_divide = true,
    can_bulk_use = true,
    bulk_use = function(self, card, area, copier, number)
        --Get most played hand type (logic yoinked from Telescope)
        local _planet, _hand, _tally = nil, nil, -1
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                _hand = v
                _tally = G.GAME.hands[v].played
            end
        end
        if _hand then
            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        local removed_levels = 0
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].level > 1 then
                local this_removed_levels = G.GAME.hands[v].level - 1
                removed_levels = removed_levels + this_removed_levels
                level_up_hand(card, v, true, -this_removed_levels)
            end
        end
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_hand, 'poker_hands'),chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level=G.GAME.hands[_hand].level})
        level_up_hand(card, _hand, false, removed_levels*3^number)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}
local quasar_sprite = {
	object_type = "Atlas",
    key = "quasar",
    path = "c_quasar.png",
    px = 71,
    py = 95
}


local vacuum_ex = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Vacuum_ex",
    key = "c_cry_vacuum",
    pos = {x=0,y=0},
	config = {extra = 10},
    loc_txt = {
        name = 'Enhanced Vacuum',
        text = {
			"Removes {C:red}all {C:green}modifications{}",
			"from {C:red}all{} cards in your hand,",
			"Earn {C:money}$#1#{} per {C:green}modification{} removed",
			"{C:inactive,s:0.7}(ex. Enhancements, Seals, Editions)"
        }
    },
    cost = 30,
    atlas = "vacuum_ex",
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra}}
    end,
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
		local earnings = 0
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.cards do
            local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.cards do
			local CARD = G.hand.cards[i]
			if CARD.config.center ~= G.P_CENTERS.c_base then
				earnings = earnings + 1
			end
			if CARD.edition then
				earnings = earnings + 1
			end
			if CARD.seal then
				earnings = earnings + 1
			end
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() CARD:flip();CARD:set_ability(G.P_CENTERS.c_base, true, nil);CARD:set_edition(nil, true);CARD:set_seal(nil, true);play_sound('tarot2', percent);CARD:juice_up(0.3, 0.3);return true end }))
        end
		ease_dollars(earnings * card.ability.extra)
    end
}
local vacuum_ex_sprite = {
    object_type = "Atlas",
    key = "vacuum_ex",
    
    path = "c_vacuum_ex.png",
    px = 71,
    py = 95
}

local hammerspace_ex = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Hammerspace_ex",
    key = "c_cry_hammerspace",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Enhanced Hammerspace',
        text = {
			"Apply random {C:attention}consumables{}",
			"as if they were {C:dark_edition}Enhancements{}",
			"to your {C:attention}entire hand{}",
			"{C:blue}+1{} hand size"
        }
    },
    cost = 30,
    atlas = "hammerspace_ex",
    can_use = function(self, card)
        return #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.cards do
            local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.cards do
			local CARD = G.hand.cards[i]
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() CARD:flip();CARD:set_ability(G.P_CENTERS[pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed('hammerspace_ex')).key], true, nil);play_sound('tarot2', percent);CARD:juice_up(0.3, 0.3);return true end }))
        end
		G.hand:change_size(1)
    end
}
local hammerspace_ex_sprite = {
    object_type = "Atlas",
    key = "hammerspace_ex",
    path = "s_hammerspace_ex.png",
    px = 71,
    py = 95
}
local analog_ex = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Analog_ex",
    key = "c_cry_analog",
    pos = {x=0,y=0},
	config = {copies = 3, ante = 0},
    loc_txt = {
        name = 'Enhanced Analog',
        text = {
			"Create {C:attention}#1#{} copies of a",
            "random {C:attention}Joker{}, destroy",
            "all other Jokers"
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.copies,center.ability.ante}}
    end,
    cost = 30,
    atlas = "analog_ex",
    can_use = function(self, card)
        return #G.jokers.cards > 0
    end,
    use = function(self, card, area, copier)
        local deletable_jokers = {}
        for k, v in pairs(G.jokers.cards) do
            if not v.ability.eternal then deletable_jokers[#deletable_jokers + 1] = v end
        end
        local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('analog_choice'))
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.75, func = function()
            for k, v in pairs(deletable_jokers) do
                if v ~= chosen_joker then 
                    v:start_dissolve(nil, _first_dissolve)
                    _first_dissolve = true
                end
            end
            return true end }))
        for i = 1, card.ability.copies do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = copy_card(chosen_joker)
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
        end
        ease_ante(card.ability.ante)
    end
}
local analog_ex_sprite = {
    object_type = "Atlas",
    key = "analog_ex",
    path = "c_analog_ex.png",
    px = 71,
    py = 95
}

local bothand = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Enhancedbothand",
    key = "c_oiim_bothand",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Enhanced Bot Hand',
        text = {
			"Convert your {C:gold}money{} into",
            "permanent {C:blue}hands{} {C:grey}(1 / 4$){}",
            "Set {C:gold}money{} to {C:gold}5${}"
        }
    },
    cost = 20,
    atlas = "enhancedbothand",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + G.GAME.dollars*0.25
        G.GAME.current_round.hands = G.GAME.current_round.hands + G.GAME.dollars*0.25
        G.GAME.dollars = 5
    end,
}
local bothand_sprite = {
    object_type = "Atlas",
    key = "enhancedbothand",
    path = "c_enhancedbothand.png",
    px = 71,
    py = 95
}
-- ULTRA ENHANCED SPECTRAL CARDS

local ultra_aura = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Ultraenhancedaura",
    key = "c_oiim_c_aura",
    pos = {x=4,y=4},
	config = {},
    loc_txt = {
        name = 'Ultra Enhanced Aura',
        text = {
			"Highlight {C:attention}any{} playable cards and",
            "set a random {C:dark_edition}edition{} on these cards",
	    "{C:inactive}(foil, holographic, polychrome, mosaic, astral, blurred){}"
        }
    },
    cost = 40,
    atlas = "ultraenhanced",
    can_use = function(self, card)
        return #G.hand.highlighted >= 1
    end,
    use = function(self, card, area, copier)
	for i = 1, #G.hand.highlighted do
	    G.hand.highlighted[i]:set_edition({[random_editions[pseudorandom('disc1', 1, #random_editions)]] = true}, true, true)
	end
    end
}

local ultra_ectoplasm = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Ultraenhancedectoplasm",
    key = "c_oiim_c_ectoplasm",
    pos = {x=8,y=4},
	config = {},
    loc_txt = {
        name = 'Ultra Enhanced Ectoplasm',
        text = {
			"Choose one jokers, and set {C:dark_edition}negative{}",
            "edition on this joker. Usable {C:attention}10{} times"
        }
    },
    cost = 20,
    atlas = "ultraenhanced",
    can_use = function(self, card)
        return #G.jokers.highlighted == 1
    end,
    use = function(self, card, area, copier)
        G.jokers.highlighted[1]:set_edition({
            negative = true
            	})
	ultra_enhanced_ectoplasm_use = ultra_enhanced_ectoplasm_use - 1
	if ultra_enhanced_ectoplasm_use ~= 0 then
	    local card = create_card('Enhancedspectrals', G.consumeables, nil,  nil, nil, nil, 'c_oiim_c_oiim_c_ectoplasm', 'Ultraenhancedectoplasm')
	    card:add_to_deck()
	    G.consumeables:emplace(card)
	elseif enhanced_ectoplasm_use == 0 then
	    ultra_enhanced_ectoplasm_use = 10
	end
    end
}

local ultra_cryptid = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Ultraenhancedcryptid",
    key = "c_oiim_c_cryptid",
    pos = {x=5,y=5},
	config = {},
    loc_txt = {
        name = 'Ultra Enhanced Cryptid',
        text = {
			"Choose {C:attention}any{} playing cards, and",
            "create {C:attention}8{} copies of these cards"
        }
    },
    cost = 20,
    atlas = "ultraenhanced",
    can_use = function(self, card)
        return #G.hand.highlighted ~= 0
    end,
    use = function(self, card, area, copier)
	for i = 1, #G.hand.highlighted do
	    for k = 1, 8 do
                local card = copy_card(G.hand.highlighted[i])
                card:start_materialize()
                card:add_to_deck()
                G.hand:emplace(card)
	    end
	end
    end
}

local ultra_quasar = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Ultraquasar",
    key = "c_oiim_c_cry_white_hole",
    pos = {x=0,y=0},
    loc_txt = {
        name = 'Ultra Quasar',
        text = { "{C:attention}Remove{} all hand levels,",
        "upgrade {C:legendary,E:1}most played{} poker hand",
        "by {C:attention}100{} for each removed level"
        }
    },
    cost = 80,
    atlas = "ultra_quasar",
    hidden = true, --default soul_rate of 0.3% in spectral packs is used
    soul_set = "Planet",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        --Get most played hand type (logic yoinked from Telescope)
        local _planet, _hand, _tally = nil, nil, -1
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                _hand = v
                _tally = G.GAME.hands[v].played
            end
        end
        if _hand then
            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        local removed_levels = 0
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].level > 1 then
                local this_removed_levels = G.GAME.hands[v].level - 1
                removed_levels = removed_levels + this_removed_levels
                level_up_hand(card, v, true, -this_removed_levels)
            end
        end
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_hand, 'poker_hands'),chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level=G.GAME.hands[_hand].level})
        level_up_hand(card, _hand, false, 100*removed_levels)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end,
    --Incantation compat
    can_stack = true,
    can_divide = true,
    can_bulk_use = true,
    bulk_use = function(self, card, area, copier, number)
        --Get most played hand type (logic yoinked from Telescope)
        local _planet, _hand, _tally = nil, nil, -1
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                _hand = v
                _tally = G.GAME.hands[v].played
            end
        end
        if _hand then
            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        local removed_levels = 0
        for k, v in ipairs(G.handlist) do
            if G.GAME.hands[v].level > 1 then
                local this_removed_levels = G.GAME.hands[v].level - 1
                removed_levels = removed_levels + this_removed_levels
                level_up_hand(card, v, true, -this_removed_levels)
            end
        end
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_hand, 'poker_hands'),chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level=G.GAME.hands[_hand].level})
        level_up_hand(card, _hand, false, removed_levels*3^number)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}
local ultra_quasar_sprite = {
	object_type = "Atlas",
    key = "ultra_quasar",
    path = "c_ultra_quasar.png",
    px = 71,
    py = 95
}

local ultra_bothand = {
    object_type = "Consumable",
    set = "Enhancedspectrals",
    name = "Ultraenhancedbothand",
    key = "c_oiim_c_oiim_bothand",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Ultra Enhanced Bot Hand',
        text = {
			"Convert your {C:gold}money{} into",
            "permanent {C:blue}hands{} {C:grey}(1 / 2$){}",
            "Set {C:gold}money{} to {C:gold}10${}"
        }
    },
    cost = 20,
    atlas = "ultrabothand",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + G.GAME.dollars*0.5
        G.GAME.current_round.hands = G.GAME.current_round.hands + G.GAME.dollars*0.5
        G.GAME.dollars = 10
    end,
}
local ultrabothand_sprite = {
    object_type = "Atlas",
    key = "ultrabothand",
    path = "c_ultraenhancedbothand.png",
    px = 71,
    py = 95
}

return {name = "EnhancedSpectrals", 
        init = function()
            --Trade - undo redeeming vouchers
            function Card:unredeem()
                if self.ability.set == "Voucher" then
                    stop_use()
                    if not self.config.center.discovered then
                        discover_card(self.config.center)
                    end
            
                    self.states.hover.can = false
                    G.GAME.used_vouchers[self.config.center_key] = nil
                    local top_dynatext = nil
                    local bot_dynatext = nil
                    
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                            top_dynatext = DynaText({string = localize{type = 'name_text', set = self.config.center.set, key = self.config.center.key}, colours = {G.C.RED}, rotate = 1,shadow = true, bump = true,float=true, scale = 0.9, pop_in = 0.6/G.SPEEDFACTOR, pop_in_rate = 1.5*G.SPEEDFACTOR})
                            bot_dynatext = DynaText({string = "Unredeemed...", colours = {G.C.RED}, rotate = 2,shadow = true, bump = true,float=true, scale = 0.9, pop_in = 1.4/G.SPEEDFACTOR, pop_in_rate = 1.5*G.SPEEDFACTOR, pitch_shift = 0.25})
                            self:juice_up(0.3, 0.5)
                            play_sound('card1')
                            play_sound('timpani')
                            self.children.top_disp = UIBox{
                                definition =    {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
                                                    {n=G.UIT.O, config={object = top_dynatext}}
                                                }},
                                config = {align="tm", offset = {x=0,y=0},parent = self}
                            }
                            self.children.bot_disp = UIBox{
                                    definition =    {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
                                                        {n=G.UIT.O, config={object = bot_dynatext}}
                                                    }},
                                    config = {align="bm", offset = {x=0,y=0},parent = self}
                                }
                        return true end }))
                    G.GAME.current_round.voucher = nil
            
                    self:unapply_to_run()
            
                    delay(0.6)
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2.6, func = function()
                        top_dynatext:pop_out(4)
                        bot_dynatext:pop_out(4)
                        return true end }))
                    
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.5, func = function()
                        self.children.top_disp:remove()
                        self.children.top_disp = nil
                        self.children.bot_disp:remove()
                        self.children.bot_disp = nil
                    return true end }))
                end
            end
            function Card:unapply_to_run(center)
                local center_table = {
                    name = center and center.name or self and self.ability.name,
                    extra = center and center.config.extra or self and self.ability.extra
                }
                local obj = center or self.config.center
                if obj.unredeem and type(obj.unredeem) == 'function' then
                    obj:unredeem(self)
                    return
                end
                if center_table.name == 'Overstock' or center_table.name == 'Overstock Plus' then
                    G.E_MANAGER:add_event(Event({func = function()
                        change_shop_size(-1)
                        return true end }))
                end
                if center_table.name == 'Tarot Merchant' or center_table.name == 'Tarot Tycoon' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.tarot_rate = G.GAME.tarot_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Planet Merchant' or center_table.name == 'Planet Tycoon' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.planet_rate = G.GAME.planet_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Hone' or center_table.name == 'Glow Up' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.edition_rate = G.GAME.edition_rate / center_table.extra
                        return true end }))
                end
                if center_table.name == 'Magic Trick' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.playing_card_rate = 0
                        return true end }))
                end
                if center_table.name == 'Crystal Ball' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
                        return true end }))
                end
                if center_table.name == 'Clearance Sale' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.discount_percent = 0
                        for k, v in pairs(G.I.CARD) do
                            if v.set_cost then v:set_cost() end
                        end
                        return true end }))
                end
                if center_table.name == 'Liquidation' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.discount_percent = G.P_CENTERS.v_clearance_sale.extra
                        for k, v in pairs(G.I.CARD) do
                            if v.set_cost then v:set_cost() end
                        end
                        return true end }))
                end
                if center_table.name == 'Reroll Surplus' or center_table.name == 'Reroll Glut' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + self.ability.extra
                        G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + self.ability.extra)
                        return true end }))
                end
                if center_table.name == 'Seed Money' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.interest_cap = center_table.extra
                        return true end }))
                end
                if center_table.name == 'Money Tree' then
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.interest_cap = G.P_CENTERS.v_seed_money.extra
                        return true end }))
                end
                if center_table.name == 'Grabber' or center_table.name == 'Nacho Tong' then
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands - center_table.extra
                    ease_hands_played(-center_table.extra)
                end
                if center_table.name == 'Paint Brush' or center_table.name == 'Palette' then
                    G.hand:change_size(-1)
                end
                if center_table.name == 'Wasteful' or center_table.name == 'Recyclomancy' then
                    G.GAME.round_resets.discards = G.GAME.round_resets.discards - center_table.extra
                    ease_discard(-center_table.extra)
                end
                if center_table.name == 'Antimatter' then
                    G.E_MANAGER:add_event(Event({func = function()
                        if G.jokers then 
                            G.jokers.config.card_limit = G.jokers.config.card_limit - 1
                        end
                        return true end }))
                end
                if center_table.name == 'Hieroglyph' or center_table.name == 'Petroglyph' then
                    ease_ante(center_table.extra)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante+center_table.extra
            
                    if center_table.name == 'Hieroglyph' then
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + center_table.extra
                        ease_hands_played(center_table.extra)
                    end
                    if center_table.name == 'Petroglyph' then
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + center_table.extra
                        ease_discard(center_table.extra)
                    end
                end
            end
        end,
        items = {enhancedspectrals, enhancedspectrals_atlas, ultraenhancedspectrals_atlas, quasar_sprite, vacuum_ex_sprite, hammerspace_ex_sprite, analog_ex_sprite, bothand_sprite, ultra_quasar_sprite, ultrabothand_sprite, aura, ectoplasm, cryptid, quasar, vacuum_ex, hammerspace_ex, analog_ex, bothand, ultra_aura, ultra_ectoplasm, ultra_cryptid, ultra_quasar, ultra_bothand}}