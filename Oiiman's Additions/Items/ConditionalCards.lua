ConditionalUse = 0
easter1 = false
easter2 = false
easter3 = false
easter4 = false
easter5 = false
easter6 = false
easter7 = false
easter8 = false
easter9 = false

local conditionalcard = {
    object_type = "ConsumableType",
    key = "Conditionalcard",
    primary_colour = HEX("956C21"),
    secondary_colour = HEX("956C21"),
    collection_rows = {3,3,3}, -- 4 pages for all code cards
    loc_txt = {
        collection = "Conditional Cards",
        name = "Conditional",
        label = "Conditional"
    },
    shop_rate = 0.0,
    default = 'c_cry_foiledition',
    can_stack = true,
    can_divide = true
}
SMODS.UndiscoveredSprite{
    atlas = 'conditional',
    key = 'Conditionalcard',
    pos = {
        x = 0,
        y = 0,
    },
}
local conditionalcard_atlas = {
    object_type = "Atlas",
    key = "conditional",
    path = "atlas_conditional.png",
    px = 71,
    py = 95
}
local conditionalcardexpert_atlas = {
    object_type = "Atlas",
    key = "conditionalexpert",
    path = "atlas_conditionalexpert.png",
    px = 71,
    py = 95
}
local conditionalcardcomplex_atlas = {
    object_type = "Atlas",
    key = "conditionalcomplex",
    path = "atlas_conditionalcomplex.png",
    px = 71,
    py = 95
}
local easteregg_atlas = {
    object_type = "Atlas",
    key = "easteregg",
    path = "atlas_easteregg.png",
    px = 71,
    py = 95
}
local ultimate_atlas = {
    object_type = "Atlas",
    key = "ultimate",
    path = "ultimate_cards.png",
    px = 71,
    py = 95
}
local pack_atlas = {
    object_type = "Atlas",
    key = "pack_conditional",
    path = "pack_conditional.png",
    px = 71,
    py = 95
}
local pack1 = {
    object_type = "Booster",
    key = "p_conditional_normal_1",
    kind = "Conditionalcard",
    atlas = "pack_conditional",
    pos = {x=0,y=0},
    config = {extra = 2, choose = 1},
    cost = 4,
    weight = 1.2,
    create_card = function(self, card)
        return create_card("Conditionalcard", G.pack_cards, nil, nil, true, true, nil, 'cry_conditional')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
    loc_txt = {
        name = "Conditional Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:cry_code} Conditional{} cards"
        }
    },
    group_key = "k_cry_conditional_pack"
}
local pack2 = {
    object_type = "Booster",
    key = "p_conditional_normal_2",
    kind = "Conditionalcard",
    atlas = "pack_conditional",
    pos = {x=1,y=0},
    config = {extra = 2, choose = 1},
    cost = 4,
    weight = 1.2,
    create_card = function(self, card)
        return create_card("Conditionalcard", G.pack_cards, nil, nil, true, true, nil, 'cry_conditional')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
    loc_txt = {
        name = "Conditional Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:cry_code} Conditional{} cards"
        }
    },
    group_key = "k_cry_conditional_pack"
}
local packJ = {
    object_type = "Booster",
    key = "p_conditional_jumbo_1",
    kind = "Conditionalcard",
    atlas = "pack_conditional",
    pos = {x=2,y=0},
    config = {extra = 4, choose = 1},
    cost = 6,
    weight = 0.6,
    create_card = function(self, card)
        return create_card("Conditionalcard", G.pack_cards, nil, nil, true, true, nil, 'cry_conditional')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
    loc_txt = {
        name = "Jumbo Conditional Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:cry_code} Conditional{} cards"
        }
    },
    group_key = "k_cry_conditional_pack"
}
local packM = {
    object_type = "Booster",
    key = "p_conditional_mega_1",
    kind = "Conditionalcard",
    atlas = "pack_conditional",
    pos = {x=3,y=0},
    config = {extra = 4, choose = 2},
    cost = 8,
    weight = 0.15,
    create_card = function(self, card)
        return create_card("Conditionalcard", G.pack_cards, nil, nil, true, true, nil, 'cry_conditional')
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
        ease_background_colour{new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2}
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = {card.config.center.config.choose, card.ability.extra} }
	end,
    loc_txt = {
        name = "Mega Conditional Pack",
        text = {
            "Choose {C:attention}#1#{} of up to",
            "{C:attention}#2#{C:cry_code} Conditional{} cards"
        }
    },
    group_key = "k_cry_conditional_pack"
}
local bitcoin = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Bitcoin",
    key = "bitcoin",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Bitcoin',
        text = {
			"If {C:gold}money{} is {C:attention}negative{},",
                        "{X:gold,C:white}X-2{} to {C:gold}money{}"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return G.GAME.dollars < 0
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars * (-2)
        ConditionalUse = ConditionalUse +1
    end
}
local scale = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Scale",
    key = "scale",
    pos = {x=1,y=0},
	config = {},
    loc_txt = {
        name = 'Scale',
        text = {
			"If you have more {C:attention}consumeables slots{} than",
                        "{C:attention}joker slots{}, {C:blue}+1{} {C:attention}joker slots{}. Else if you have",
                        "more {C:attention}joker slots{} than {C:attention}consumeables slots{},",
                        "{C:blue}+1{} {C:attention}consumeable slots{}"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return G.consumeables.config.card_limit ~= G.jokers.config.card_limit
    end,
    use = function(self, card, area, copier)
        if G.jokers.config.card_limit < G.consumeables.config.card_limit then
            G.jokers.config.card_limit = G.jokers.config.card_limit +1
        elseif G.jokers.config.card_limit > G.consumeables.config.card_limit then
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
        end
        ConditionalUse = ConditionalUse +1
    end
}
local recall = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Recall",
    key = "recall",
    pos = {x=2,y=0},
	config = {},
    loc_txt = {
        name = 'Recall',
        text = {
			"If you have less than 2 jokers, create",
                        "a {C:attention}:D{} joker"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return #G.jokers.cards <= 2
    end,
    use = function(self, card, area, copier)
        local card = create_card('Joker', G.jokers, nil,  nil, nil, nil, 'j_cry_happy', 'recall')
        card:add_to_deck()
        G.jokers:emplace(card)
        ConditionalUse = ConditionalUse +1
    end
}
local investment = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Investment",
    key = "investment",
    pos = {x=0,y=1},
	config = {},
    loc_txt = {
        name = 'Investment',
        text = {
			"If {C:gold}money{} is under or equals to {C:attention}10${},",
                        "{X:gold,C:white}X8{} to {C:gold}money{}"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return G.GAME.dollars <= 10
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars * 8
        ConditionalUse = ConditionalUse +1
    end
}
local doomed = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Doomed",
    key = "doomed",
    pos = {x=1,y=1},
	config = {},
    loc_txt = {
        name = 'Doomed',
        text = {
			"If you have no jokers, add",
                        "a random {C:dark_edition}epic{} joker",
			"{C:inactive}(Art by : b.b.b.b.){}"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return #G.jokers.cards == 0
    end,
    use = function(self, card, area, copier)
        local card = create_card('Joker', G.jokers, nil, "cry_epic", nil, nil, nil, 'doomed')
        card:add_to_deck()
        G.jokers:emplace(card)
        ConditionalUse = ConditionalUse +1
    end
}
local extension = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Extension",
    key = "extension",
    pos = {x=2,y=1},
	config = {},
    loc_txt = {
        name = 'Extension',
        text = {
			"If joker and consumeable slots are full,",
                        " add {C:blue}+1{} slot at joker and consumeable slots"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return (#G.jokers.cards >= G.jokers.config.card_limit) and (#G.consumeables.cards >= G.consumeables.config.card_limit)
    end,
    use = function(self, card, area, copier)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        G.consumeables.config.card_limit = G.consumeables.config.card_limit +1
        ConditionalUse = ConditionalUse +1
    end
}
local debt = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Debt",
    key = "debt",
    pos = {x=0,y=2},
	config = {},
    loc_txt = {
        name = 'Debt',
        text = {
			"If you have no {C:gold}money{},",
                        "{C:gold}+15${}"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return G.GAME.dollars == 0
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars + 15
        ConditionalUse = ConditionalUse +1
    end
}
local squid = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Squid",
    key = "squid",
    pos = {x=1,y=2},
	config = {},
    loc_txt = {
        name = 'Squid',
        text = {
			"If you have only 1 joker,",
                        "add a copy with {C:dark_edition}Oversaturated Edition{}"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return #G.jokers.cards == 1
    end,
    use = function(self, card, area, copier)
        local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('squid'))
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
        local card = copy_card(chosen_joker)
        card:start_materialize()
        card:set_edition({cry_oversat = true}, true)
        card:add_to_deck()
        G.jokers:emplace(card)
        return true end }))
        ConditionalUse = ConditionalUse +1
    end
}
local balloon = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Balloon",
    key = "balloon",
    pos = {x=2,y=2},
	config = {},
    loc_txt = {
        name = 'Balloon',
        text = {
			"If you have more {C:attention}jokers{} than",
                        "{C:attention}joker slots{}, {X:blue,C:white}X2{} to {C:attention}joker slots{}"
        }
    },
    cost = 4,
    atlas = "conditional",
    can_use = function(self, card)
        return G.jokers.config.card_limit < #G.jokers.cards
    end,
    use = function(self, card, area, copier)
        G.jokers.config.card_limit = G.jokers.config.card_limit * 2
        ConditionalUse = ConditionalUse +1
    end
}
local oneup = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Oneup",
    key = "oneup",
    pos = {x=0,y=0},
    soul_pos = {x=3,y=0},
	config = {},
    loc_txt = {
        name = '1 UP',
        text = {
			"If you have no {C:attention}jokers{} and no {C:gold}money{},",
                        "adds a random {C:dark_edition}epic{} joker with {C:dark_edition}polychrome{} edition"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return #G.jokers.cards == 0 and G.GAME.dollars == 0
    end,
    use = function(self, card, area, copier)
        local card = create_card('Joker', G.jokers, nil, "cry_epic", nil, nil, nil, '1up')
        card:set_edition({polychrome = true}, true)
        card:add_to_deck()
        G.jokers:emplace(card)
        ConditionalUse = ConditionalUse +1
    end
}
local bullet = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Bullet",
    key = "bullet",
    pos = {x=1,y=0},
    soul_pos = {x=4,y=0},
	config = {},
    loc_txt = {
        name = 'Bullet',
        text = {
			"If you have only {C:attention}1{} joker and {C:attention}negative money{},",
                        "gives him {C:dark_edition}astral{} edition. Set {C:gold}money{} to 0",
                        "Highlight the joker to activate it"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return #G.jokers.cards == 1 and G.GAME.dollars < 0 and G.jokers.highlighted[1]
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = 0
        G.jokers.highlighted[1]:set_edition({
            cry_astral = true
            	})
        ConditionalUse = ConditionalUse +1
    end
}
local dysmomentane = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Dysmomentane",
    key = "dysmomentane",
    pos = {x=2,y=0},
    soul_pos = {x=5,y=0},
	config = {},
    loc_txt = {
        name = 'Dysmomentané',
        text = {
			"If you have above {C:gold}100${}, add",
                        "{C:dark_edition}blurred{} edition to the leftmost joker"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return G.GAME.dollars >= 100
    end,
    use = function(self, card, area, copier)
        G.jokers.cards[1]:set_edition({
            cry_blur = true
            	})
        ConditionalUse = ConditionalUse +1
    end
}
local decajoker = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Decajoker",
    key = "decajoker",
    pos = {x=0,y=1},
    soul_pos = {x=3,y=1},
	config = {},
    loc_txt = {
        name = 'Deca-Joker',
        text = {
			"If you have exactly {C:attention}10{} jokers,",
                        "{C:gold}+20${} and adds 2 {C:dark_edition}epic{} jokers"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return #G.jokers.cards == 10
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars + 20
	for i = 1, 2 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Joker', G.jokers, nil, "cry_epic", nil, nil, nil, 'decajoker')
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
    end
}
local antijoker = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Antijoker",
    key = "antijoker",
    pos = {x=1,y=1},
    soul_pos = {x=4,y=1},
	config = {},
    loc_txt = {
        name = 'Anti-Joker',
        text = {
			"If you have {C:attention}negative{} {C:dark_edition}joker slots{},",
                        "{X:attention,C:white}X-10{} to {C:dark_edition}joker slots{}"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return G.jokers.config.card_limit < 0
    end,
    use = function(self, card, area, copier)
        G.jokers.config.card_limit = G.jokers.config.card_limit *(-10)
        ConditionalUse = ConditionalUse +1
    end
}
local blackeye = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Blackeye",
    key = "blackeye",
    pos = {x=2,y=1},
    soul_pos = {x=5,y=1},
	config = {},
    loc_txt = {
        name = 'Black Eye',
        text = {
			"If you have only 1 joker with {C:dark_edition}blurred{} edition,",
                        "create {C:attention}2{} copies of this joker"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return #G.jokers.cards == 1 and G.jokers.cards[1].edition and G.jokers.cards[1].edition.cry_blur
    end,
    use = function(self, card, area, copier)
	for i = 1, 2 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = copy_card(G.jokers.cards[1])
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
    end
}
local goldsquare = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Goldsquare",
    key = "goldsquare",
    pos = {x=0,y=2},
    soul_pos = {x=3,y=2},
	config = {},
    loc_txt = {
        name = 'Gold Square',
        text = {
			"If you have under {C:red}-20${},",
                        "{X:dark_edition,C:white}^2{} to {C:gold}money{}"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return G.GAME.dollars <= -20
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars * G.GAME.dollars
        ConditionalUse = ConditionalUse +1
    end
}
local maybe = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Maybe",
    key = "maybe",
    pos = {x=1,y=2},
    soul_pos = {x=4,y=2},
	config = {},
    loc_txt = {
        name = ' "Maybe" ',
        text = {
			"If you used at least 3 {C:green}conditional cards{}",
                        "in your game, {C:gold}+20${} and {C:dark_edition}+1 joker slot{}"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return ConditionalUse >= 3
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars + 20
        G.jokers.config.card_limit = G.jokers.config.card_limit +1
        ConditionalUse = ConditionalUse +1
    end
}
local antiitem = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Antiitem",
    key = "antiitem",
    pos = {x=2,y=2},
    soul_pos = {x=5,y=2},
	config = {},
    loc_txt = {
        name = 'Anti-Item',
        text = {
			"If you have negative {C:attention}consumable slots{},",
                        "{C:attention}X-6{} to {C:attention}consumable slots{}"
        }
    },
    cost = 4,
    atlas = "conditionalexpert",
    can_use = function(self, card)
        return G.consumeables.config.card_limit < 0
    end,
    use = function(self, card, area, copier)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit * (-6)
        ConditionalUse = ConditionalUse +1
    end
}
local how = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-How",
    key = "how",
    pos = {x=0,y=0},
    soul_pos = {x=3,y=0},
	config = {},
    loc_txt = {
        name = ' "How" ',
        text = {
			"If you used at least 10 {C:green}conditional cards{},",
                        "create 2 {C:dark_edition}exotic{} jokers"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return ConditionalUse >= 10
    end,
    use = function(self, card, area, copier)
	for i = 1, 2 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'how')
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
    end
}
local postgame = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Postgame",
    key = "postgame",
    pos = {x=1,y=0},
    soul_pos = {x=4,y=0},
	config = {},
    loc_txt = {
        name = 'Post-game',
        text = {
			"If you are above {C:attention}ante 8{},",
                        "create an {C:dark_edition}exotic{} jokers"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return G.GAME.round_resets.ante > 8
    end,
    use = function(self, card, area, copier)
        local card = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'postgame')
        card:add_to_deck()
        G.jokers:emplace(card)
        ConditionalUse = ConditionalUse +1
    end
}
local prime = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Prime",
    key = "prime",
    pos = {x=2,y=0},
    soul_pos = {x=5,y=0},
	config = {},
    loc_txt = {
        name = 'Prime',
        text = {
			"If your money is a {C:attention}prime number{}",
                        "under {C:attention}100{}, {X:gold,C:white} X10{} to {C:gold}money{}"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return G.GAME.dollars == 2 or G.GAME.dollars == 3 or G.GAME.dollars == 5 or G.GAME.dollars == 7 or G.GAME.dollars == 11 or G.GAME.dollars == 13 or G.GAME.dollars == 17 or G.GAME.dollars == 19 or G.GAME.dollars == 23 or G.GAME.dollars == 29 or G.GAME.dollars == 31 or G.GAME.dollars == 37 or G.GAME.dollars == 41 or G.GAME.dollars == 43 or G.GAME.dollars == 47 or G.GAME.dollars == 53 or G.GAME.dollars == 59 or G.GAME.dollars == 61 or G.GAME.dollars == 67 or G.GAME.dollars == 71 or G.GAME.dollars == 73 or G.GAME.dollars == 79 or G.GAME.dollars == 83 or G.GAME.dollars == 89 or G.GAME.dollars == 97
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars * 10
        ConditionalUse = ConditionalUse +1
    end
}
local hectojoker = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Hectojoker",
    key = "hectojoker",
    pos = {x=0,y=1},
    soul_pos = {x=3,y=1},
	config = {},
    loc_txt = {
        name = 'Hecto-Joker',
        text = {
			"If you have exactly {C:attention}100{} jokers,",
                        "{X:gold,C:white}X100{} to {C:gold}money{}, create 5 {C:dark_edition}exotic{} jokers"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return G.jokers.config.card_limit == 100
    end,
    use = function(self, card, area, copier)
	for i = 1, 5 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'hectojoker')
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
    end
}
local minus = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Minus",
    key = "minus",
    pos = {x=1,y=1},
    soul_pos = {x=4,y=1},
	config = {},
    loc_txt = {
        name = 'Minus',
        text = {
			"If you {C:gold}money{} is equals",
                        "to {C:red}-100{}, {X:dark_edition,C:white}^2{} to {C:gold}money{}"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return G.GAME.dollars == -100
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars ^ 2
        ConditionalUse = ConditionalUse +1
    end
}
local euler = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Euler",
    key = "euler",
    pos = {x=2,y=1},
    soul_pos = {x=5,y=1},
	config = {},
    loc_txt = {
        name = 'Euler',
        text = {
			"If {C:attention}jokers{} and {C:attention}consumeables{} slots are equal",
                        "to -1, {X:dark_edition,C:white}^4{} to money, +3 {C:dark_edition}exotic{} jokers"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return G.consumeables.config.card_limit == -1 and G.jokers.config.card_limit == -1
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars ^ 4
	for i = 1, 3 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'euler')
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
    end
}
local severed = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Severed",
    key = "severed",
    pos = {x=0,y=2},
    soul_pos = {x=3,y=2},
	config = {},
    loc_txt = {
        name = 'Severed',
        text = {
			"If you have {C:red}-1 discards{},",
                        "{X:dark_edition,C:white}^5{} to permanent {C:blue}hands{}"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return G.GAME.round_resets.discards == -1
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands ^ 5
        ConditionalUse = ConditionalUse +1
    end
}
local bigbang = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Bigbang",
    key = "bigbang",
    pos = {x=1,y=2},
    soul_pos = {x=4,y=2},
	config = {},
    loc_txt = {
        name = 'Big Bang',
        text = {
			"If the current ante is negative,",
                        "set ante to {C:attention}-50{}"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return G.GAME.round_resets.ante < 0
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.ante = -50
        G.GAME.current_round.ante = -50
        ConditionalUse = ConditionalUse +1
    end
}
local detonator = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Detonator",
    key = "detonator",
    pos = {x=2,y=2},
    soul_pos = {x=5,y=2},
	config = {},
    loc_txt = {
        name = 'Detonator',
        text = {
			"If you have only 1 playable card",
                        "in hand, +6 {C:dark_edition}exotic{} jokers"
        }
    },
    cost = 4,
    atlas = "conditionalcomplex",
    can_use = function(self, card)
        return #G.hand.cards == 1
    end,
    use = function(self, card, area, copier)
	for i = 1, 6 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'detonator')
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
    end
}
local easteregg1 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg1",
    key = "easteregg1",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'First Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{C:blue}+10{} permanent hands"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return G.GAME.dollars >= 50 and G.GAME.dollars <= 60 and G.GAME.round_resets.ante >= 10 and G.jokers.config.card_limit >= 10
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 10
        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 10
        ConditionalUse = ConditionalUse +1
	easter1 = true
    end
}
local easteregg2 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg2",
    key = "easteregg2",
    pos = {x=1,y=0},
	config = {},
    loc_txt = {
        name = 'Second Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{X:dark_edition,C:white}^10{} money"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return G.GAME.dollars == 10 and G.consumeables.config.card_limit == 0 and G.GAME.round_resets.ante == 14
    end,
    use = function(self, card, area, copier)
	G.GAME.dollars = G.GAME.dollars ^ 10
        ConditionalUse = ConditionalUse +1
	easter2 = true
    end
}
local easteregg3 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg3",
    key = "easteregg3",
    pos = {x=2,y=0},
	config = {},
    loc_txt = {
        name = 'Third Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{C:green}+10{} conditional cards"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return ConditionalUse >= 15 and G.GAME.dollars >= 150 and G.jokers.config.card_limit >= 15
    end,
    use = function(self, card, area, copier)
	for i = 1, 10 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Conditionalcard', G.consumeables, nil, nil, nil, nil, nil, 'easteregg3')
                card:start_materialize()
                card:add_to_deck()
                G.consumeables:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
	easter3 = true
    end
}
local easteregg4 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg4",
    key = "easteregg4",
    pos = {x=0,y=1},
	config = {},
    loc_txt = {
        name = 'Fourth Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{C:dark_edition}+10{} exotic jokers"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return G.GAME.dollars == 0 and #G.jokers.cards == 0 and #G.consumeables.cards == 0
    end,
    use = function(self, card, area, copier)
	for i = 1, 10 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'easteregg4')
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
	easter4 = true
    end
}
local easteregg5 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg5",
    key = "easteregg5",
    pos = {x=1,y=1},
	config = {},
    loc_txt = {
        name = 'Fifth Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{C:red}+10{} permanent discards"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return G.GAME.round_resets.hands > G.GAME.round_resets.discards and #G.jokers.cards == G.jokers.config.card_limit and G.GAME.dollars <= 10
    end,
    use = function(self, card, area, copier)
	G.GAME.round_resets.discards = G.GAME.round_resets.discards + 10
	G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 10
        ConditionalUse = ConditionalUse +1
	easter5 = true
    end
}
local easteregg6 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg6",
    key = "easteregg6",
    pos = {x=2,y=1},
	config = {},
    loc_txt = {
        name = 'Sixth Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{C:dark_edition}+10{} joker slots"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return G.jokers.config.card_limit <= 5 and #G.jokers.cards <= 3 and G.GAME.dollars >= 50
    end,
    use = function(self, card, area, copier)
	G.jokers.config.card_limit = G.jokers.config.card_limit + 10
        ConditionalUse = ConditionalUse +1
	easter6 = true
    end
}
local easteregg7 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg7",
    key = "easteregg7",
    pos = {x=0,y=2},
	config = {},
    loc_txt = {
        name = 'Seventh Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{C:attention}+10{} consumeable slots"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return G.consumeables.config.card_limit <= 2 and #G.consumeables.cards >= 1 and G.GAME.dollars >= 60
    end,
    use = function(self, card, area, copier)
	G.consumeables.config.card_limit = G.consumeables.config.card_limit + 10
        ConditionalUse = ConditionalUse +1
	easter7 = true
    end
}
local easteregg8 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg8",
    key = "easteregg8",
    pos = {x=1,y=2},
	config = {},
    loc_txt = {
        name = 'Eighth Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{C:dark_edition}+10{} spectral cards"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return G.GAME.dollars == 0 and #G.jokers.cards == 5 and #G.consumeables.cards == 0
    end,
    use = function(self, card, area, copier)
	for i = 1, 10 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'easteregg8')
                card:start_materialize()
                card:add_to_deck()
                G.consumeables:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
	easter8 = true
    end
}
local easteregg9 = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Easteregg9",
    key = "easteregg9",
    pos = {x=2,y=2},
	config = {},
    loc_txt = {
        name = 'Ninth Easter Egg',
        text = {
			"{C:inactive}Unknown Conditions{}",
                        "{C:attention}+10{} tarot cards"
        }
    },
    cost = 4,
    atlas = "easteregg",
    can_use = function(self, card)
        return G.GAME.dollars == 0 and #G.jokers.cards == 5 and #G.consumeables.cards == 0
    end,
    use = function(self, card, area, copier)
	for i = 1, 10 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'easteregg9')
                card:start_materialize()
                card:add_to_deck()
                G.consumeables:emplace(card)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
	easter9 = true
    end
}
local ultimate = {
    object_type = "Consumable",
    set = "Conditionalcard",
    name = "cry-Ultimate",
    key = "ultimate_card",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Ultimate Conditional Card',
        text = {
			"If all {C:green}Easter Egg{} Cards have been used,",
                        "Apply the effects of all {C:green}Easter Egg{} Cards"
        }
    },
    cost = 4,
    atlas = "ultimate",
    can_use = function(self, card)
        return easter1 == true and easter2 == true and easter3 == true and easter4 == true and easter5 == true and easter6 == true and easter7 == true and easter8 == true and easter9 == true
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 10
        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 10
	G.GAME.dollars = G.GAME.dollars ^ 10
	G.GAME.round_resets.discards = G.GAME.round_resets.discards + 10
	G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 10
	G.jokers.config.card_limit = G.jokers.config.card_limit + 10
	G.consumeables.config.card_limit = G.consumeables.config.card_limit + 10
	for i = 1, 10 do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'easteregg9')
                card:start_materialize()
                card:add_to_deck()
                G.consumeables:emplace(card)
                local card2 = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'easteregg8')
                card2:start_materialize()
                card2:add_to_deck()
                G.consumeables:emplace(card2)
                local card3 = create_card('Joker', G.jokers, nil, "cry_exotic", nil, nil, nil, 'easteregg4')
                card3:start_materialize()
                card3:add_to_deck()
                G.jokers:emplace(card3)
                local card4 = create_card('Conditionalcard', G.consumeables, nil, nil, nil, nil, nil, 'easteregg3')
                card4:start_materialize()
                card4:add_to_deck()
                G.consumeables:emplace(card4)
                return true end }))
	end
        ConditionalUse = ConditionalUse +1
    end
}

local conditional_cards = {conditionalcard, conditionalcard_atlas, conditionalcardexpert_atlas, conditionalcardcomplex_atlas, easteregg_atlas, ultimate_atlas, pack_atlas, pack1, pack2, packJ, packM, bitcoin, scale, recall, investment, doomed, extension, debt, squid, balloon, oneup, bullet, dysmomentane, decajoker, antijoker, blackeye, goldsquare, maybe, antiitem, how, postgame, prime, hectojoker, minus, euler, severed, bigbang, detonator, easteregg1, easteregg2, easteregg3, easteregg4, easteregg5, easteregg6, easteregg7, easteregg8, easteregg9, ultimate}
return {name = "Conditional Cards",
        init = function()
            --allow Program Packs to let you keep the cards
            local G_UIDEF_use_and_sell_buttons_ref=G.UIDEF.use_and_sell_buttons
            function G.UIDEF.use_and_sell_buttons(card)
                if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a use button
                    if card.ability.set == "Conditionalcard" then
                        return {
                            n=G.UIT.ROOT, config = {padding = -0.1,  colour = G.C.CLEAR}, nodes={
                            {n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, minh = 0.7*card.T.h, maxw = 0.7*card.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_reserve_card'}, nodes={
                                {n=G.UIT.T, config={text = "RESERVE",colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
                            }},
                            {n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, maxw = 0.9*card.T.w - 0.15, minh = 0.1*card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'Do you know that this parameter does nothing?', func = 'can_use_consumeable'}, nodes={
                                {n=G.UIT.T, config={text = localize('b_use'),colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true}}
                            }},
                            {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                            {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                            {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                            {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                            -- Betmma can't explain it, neither can I
                        }}
                    end
                end
                return G_UIDEF_use_and_sell_buttons_ref(card)
            end
            --Code from Betmma's Vouchers
            G.FUNCS.can_reserve_card = function(e)
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    e.config.colour = G.C.GREEN
                    e.config.button = 'reserve_card'
                else
                  e.config.colour = G.C.UI.BACKGROUND_INACTIVE
                  e.config.button = nil
                end
            end
            G.FUNCS.reserve_card = function(e)
                local c1 = e.config.ref_table
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                    c1.area:remove_card(c1)
                    c1:add_to_deck()
                    if c1.children.price then c1.children.price:remove() end
                    c1.children.price = nil
                    if c1.children.buy_button then c1.children.buy_button:remove() end
                    c1.children.buy_button = nil
                    remove_nils(c1.children)
                    G.consumeables:emplace(c1)
                    G.GAME.pack_choices = G.GAME.pack_choices - 1
                    if G.GAME.pack_choices <= 0 then
                        G.FUNCS.end_consumeable(nil, delay_fac)
                    end
                    return true
                    end
                }))
            end
        end,
        items = conditional_cards}
