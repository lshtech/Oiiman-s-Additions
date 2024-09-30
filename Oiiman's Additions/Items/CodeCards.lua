

local code_atlas = {
    object_type = "Atlas",
    key = "codemoeditions",
    path = "c_code.png",
    px = 71,
    py = 95
}
local ransomware = {
    object_type = "Consumable",
    set = "Code",
    name = "Ransomware",
    key = "ransomware",
    pos = {x=0,y=1},
	config = {},
    loc_txt = {
        name = '://RANSOMWARE',
        text = {
			"Add {C:gold}200${} to current {C:gold}money{}",
                        "{C:red}-1{} to {C:blue}hands{}, {C:red}discards{}, {C:dark_edition}jokers{}",
                        " and {C:attention}consumeables{} slots"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars + 200
        G.GAME.round_resets.hands = G.GAME.round_resets.hands -1
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - 1
    end
}
local hardmode = {
    object_type = "Consumable",
    set = "Code",
    name = "Hardmode",
    key = "hardmode",
    pos = {x=1,y=1},
	config = {},
    loc_txt = {
        name = '://HARDMODE',
        text = {
			"There is {C:attention}only vouchers{} in shop",
                        "{X:mult,C:white}X2{} to {C:blue}hands{}, {C:red}discards{}, {C:dark_edition}jokers{}",
                        " and {C:attention}consumeables{} slots"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.shop.joker_max = 0
         G.GAME.modifiers.cry_booster_packs = 0
        G.GAME.round_resets.hands = G.GAME.round_resets.hands * 2
        G.GAME.round_resets.discards = G.GAME.round_resets.discards * 2
        G.jokers.config.card_limit = G.jokers.config.card_limit * 2
        G.consumeables.config.card_limit = G.consumeables.config.card_limit * 2
    end
}
local ddos = {
    object_type = "Consumable",
    set = "Code",
    name = "Ddos",
    key = "ddos",
    pos = {x=2,y=1},
	config = {},
    loc_txt = {
        name = '://DDOS',
        text = {
			"{C:red}+2${} in shop prizes",
                        "{C:gold}+1${} interest"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.inflation = G.GAME.inflation + 2
        G.GAME.interest_amount = G.GAME.interest_amount + 1
    end
}
local freecard = {
    object_type = "Consumable",
    set = "Code",
    name = "Freecard",
    key = "freecard",
    pos = {x=2,y=0},
	config = {},
    loc_txt = {
        name = '://FREECARD',
        text = {
			"Multiplies {C:gold}money{} by {C:red}-1{}",
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return G.GAME.dollars ~= 0
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars * (-1)
    end
}
local paste = {
    object_type = "Consumable",
    set = "Code",
    name = "Paste",
    key = "paste",
    pos = {x=4,y=0},
	config = {},
    loc_txt = {
        name = '://PASTE',
        text = {
			"Place the {C:dark_edition}edition{} of the leftmost {C:attention}playing card{}",
                        "to the leftmost {C:dark_edition}joker{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return #G.hand.cards > 0 and #G.jokers.cards > 0 and (G.hand.cards[1].edition)
    end,
    use = function(self, card, area, copier)
      if G.hand.cards[1].edition then
        if G.hand.cards[1].edition.foil then
            G.jokers.cards[1]:set_edition({
             			    foil = true
          	    })
            G.hand.cards[1]:set_edition({
             			    foil = false
          	    })
	
        elseif G.hand.cards[1].edition.holo then
            G.jokers.cards[1]:set_edition({
             			    holo = true
          	    })
            G.hand.cards[1]:set_edition({
             			    holo = false
          	    })

        elseif G.hand.cards[1].edition.phantom then
            G.jokers.cards[1]:set_edition({
             			    phantom = true
          	    })
            G.hand.cards[1]:set_edition({
             			    phantom = false
          	    })

        elseif G.hand.cards[1].edition.tentacle then
            G.jokers.cards[1]:set_edition({
             			    tentacle = true
          	    })
            G.hand.cards[1]:set_edition({
             			    tentacle = false
          	    })

        elseif G.hand.cards[1].edition.bunc_fluorescent then
            G.jokers.cards[1]:set_edition({
             			    bunc_fluorescent = true
          	    })
            G.hand.cards[1]:set_edition({
             			    bunc_fluorescent = false
          	    })

        elseif G.hand.cards[1].edition.bunc_glitter then
            G.jokers.cards[1]:set_edition({
             			    bunc_glitter = true
          	    })
            G.hand.cards[1]:set_edition({
             			    bunc_glitter = false
          	    })
	
        elseif G.hand.cards[1].edition.polychrome then
            G.jokers.cards[1]:set_edition({
             			    polychrome = true
          	    })
            G.hand.cards[1]:set_edition({
             			    polychrome = false
          	    })
	
        elseif G.hand.cards[1].edition.negative then
            G.jokers.cards[1]:set_edition({
             			    negative = true
          	    })
            G.hand.cards[1]:set_edition({
             			    negative = false
          	    })

        elseif G.hand.cards[1].edition.cry_mosaic then
            G.jokers.cards[1]:set_edition({
             			    cry_mosaic = true
          	    })
            G.hand.cards[1]:set_edition({
             			    cry_mosaic = false
          	    })

        elseif G.hand.cards[1].edition.cry_oversat then
            G.jokers.cards[1]:set_edition({
             			    cry_oversat = true
          	    })
            G.hand.cards[1]:set_edition({
             			    cry_oversat = false
          	    })
	
        elseif G.hand.cards[1].edition.cry_glitched then
            G.jokers.cards[1]:set_edition({
             			    cry_glitched = true
          	    })
            G.hand.cards[1]:set_edition({
             			    cry_glitched = false
          	    })

        elseif G.hand.cards[1].edition.cry_astral then
            G.jokers.cards[1]:set_edition({
             			    cry_astral = true
          	    })
            G.hand.cards[1]:set_edition({
             			    cry_astral = false
          	    })

        elseif G.hand.cards[1].edition.cry_blur then
            G.jokers.cards[1]:set_edition({
             			    cry_blur = true
          	    })
            G.hand.cards[1]:set_edition({
             			    cry_blur = false
          	    })
	
        end
      end
    end
}

local cut = {
    object_type = "Consumable",
    set = "Code",
    name = "Cut",
    key = "cut",
    pos = {x=5,y=0},
	config = {},
    loc_txt = {
        name = '://CUT',
        text = {
			"Place the {C:dark_edition}edition{} of the leftmost {C:dark_edition}joker{}",
                        "to the leftmost {C:attention}playing card{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return #G.hand.cards > 0 and #G.jokers.cards > 0 and (G.jokers.cards[1].edition)
    end,
    use = function(self, card, area, copier)
      if G.jokers.cards[1].edition then
        if G.jokers.cards[1].edition.foil then
            G.hand.cards[1]:set_edition({
             			    foil = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    foil = false
          	    })
	
        elseif G.jokers.cards[1].edition.holo then
            G.hand.cards[1]:set_edition({
             			    holo = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    holo = false
          	    })

        elseif G.jokers.cards[1].edition.phantom then
            G.hand.cards[1]:set_edition({
             			    phantom = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    phantom = false
          	    })

        elseif G.jokers.cards[1].edition.tentacle then
            G.hand.cards[1]:set_edition({
             			    tentacle = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    tentacle = false
          	    })

        elseif G.jokers.cards[1].edition.bunc_fluorescent then
            G.hand.cards[1]:set_edition({
             			    bunc_fluorescent = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    bunc_fluorescent = false
          	    })

        elseif G.jokers.cards[1].edition.bunc_glitter then
            G.hand.cards[1]:set_edition({
             			    bunc_glitter = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    bunc_glitter = false
          	    })
	
        elseif G.jokers.cards[1].edition.polychrome then
            G.hand.cards[1]:set_edition({
             			    polychrome = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    polychrome = false
          	    })
	
        elseif G.jokers.cards[1].edition.negative then
            G.hand.cards[1]:set_edition({
             			    negative = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    negative = false
          	    })

        elseif G.jokers.cards[1].edition.cry_mosaic then
            G.hand.cards[1]:set_edition({
             			    cry_mosaic = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    cry_mosaic = false
          	    })

        elseif G.jokers.cards[1].edition.cry_oversat then
            G.hand.cards[1]:set_edition({
             			    cry_oversat = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    cry_oversat = false
          	    })
	
        elseif G.jokers.cards[1].edition.cry_glitched then
            G.hand.cards[1]:set_edition({
             			    cry_glitched = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    cry_glitched = false
          	    })

        elseif G.jokers.cards[1].edition.cry_astral then
            G.hand.cards[1]:set_edition({
             			    cry_astral = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    cry_astral = false
          	    })

        elseif G.jokers.cards[1].edition.cry_blur then
            G.hand.cards[1]:set_edition({
             			    cry_blur = true
          	    })
            G.jokers.cards[1]:set_edition({
             			    cry_blur = false
          	    })

        end
      end
    end
}
local warp = {
    object_type = "Consumable",
    set = "Code",
    name = "Warp",
    key = "warp",
    pos = {x=3,y=1},
	config = {},
    loc_txt = {
        name = '://WARP',
        text = {
			"Set the current {C:attention}ante{} at the current {C:gold}money{}",
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
	G.GAME.current_round.ante = 0
	G.GAME.round_resets.ante = 0
        ease_ante(G.GAME.dollars)
    end
}
local harddrive = {
    object_type = "Consumable",
    set = "Code",
    name = "Hard-Drive",
    key = "harddrive",
    pos = {x=4,y=1},
	config = {},
    loc_txt = {
        name = '://HARD-DRIVE',
        text = {
			"Set the {C:attention}leftmost{} card on joker slots at {C:attention}consumeable{} slots",
			"{C:inactive}Unlimited use{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return G.jokers.cards[1].config.center.key ~= 'c_oiim_harddrive' and #G.jokers.cards ~= 0
    end,
    use = function(self, card, area, copier)
        local card = copy_card(G.jokers.cards[1])
        G.jokers.cards[1]:start_dissolve(nil, true)
        card:start_materialize()
        card:add_to_deck()
        G.consumeables:emplace(card)
        local card2 = create_card('Code', G.consumeables, nil,  nil, nil, nil, 'c_oiim_harddrive', 'ram')
        card2:add_to_deck()
        G.consumeables:emplace(card2)
    end
}
local ram = {
    object_type = "Consumable",
    set = "Code",
    name = "Ram",
    key = "ram",
    pos = {x=5,y=1},
	config = {},
    loc_txt = {
        name = '://RAM',
        text = {
			"Set the {C:attention}leftmost{} card on consumeable slots at {C:attention}joker{} slots",
			"{C:inactive}Unlimited use{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return G.consumeables.cards[1].config.center.key ~= 'c_oiim_ram'
    end,
    use = function(self, card, area, copier)
        local card = copy_card(G.consumeables.cards[1])
        G.consumeables.cards[1]:start_dissolve(nil, true)
        card:start_materialize()
        card:add_to_deck()
        G.jokers:emplace(card)
        local card2 = create_card('Code', G.consumeables, nil,  nil, nil, nil, 'c_oiim_ram', 'ram')
        card2:add_to_deck()
        G.consumeables:emplace(card2)
    end
}
local trojan = {
    object_type = "Consumable",
    set = "Code",
    name = "Trojan",
    key = "trojan",
    pos = {x=0,y=2},
	config = {},
    loc_txt = {
        name = '://TROJAN',
        text = {
			"Destroy all {C:attention}stored{} consumeables",
			"gain {C:gold}4${} per card destroyed."
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
	G.GAME.dollars = G.GAME.dollars + 4*#G.consumeables.cards
        for i = 1, #G.consumeables.cards do
	    G.consumeables.cards[i]:start_dissolve(nil, true)
	end
    end
}
local encoding = {
    object_type = "Consumable",
    set = "Code",
    name = "Encoding",
    key = "encoding",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = '://ENCODING',
        text = {
			"Upgrades the highlighted {C:dark_edition}spectral{} card,",
			"Place the spectral card at the left of {C:green}Encoding{}",
			"cost {C:gold}20${}",
			"{C:inactive}Unlimited use{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return #G.consumeables.highlighted == 2 and G.GAME.dollars >= 20 and G.consumeables.highlighted[1] and G.consumeables.highlighted[2] and (G.consumeables.highlighted[1].config.center.set == 'Spectral' or G.consumeables.highlighted[1].config.center.set == 'Enhancedspectrals')
    end,
    use = function(self, card, area, copier)
	local card = create_card('Enhancedspectrals', G.consumeables, nil,  nil, nil, nil, 'c_oiim_'..G.consumeables.highlighted[1].config.center.key, 'encoding')
	card:add_to_deck()
	G.consumeables:emplace(card)
	G.consumeables.highlighted[1]:start_dissolve(nil, true)
	local card2 = create_card('Code', G.consumeables, nil,  nil, nil, nil, 'c_oiim_encoding', 'encoding')
	card2:add_to_deck()
	G.consumeables:emplace(card2)
	G.GAME.dollars = G.GAME.dollars - 20
    end
}
local emotet = {
    object_type = "Consumable",
    set = "Code",
    name = "Emotet",
    key = "emotet",
    pos = {x=1,y=2},
	config = {},
    loc_txt = {
        name = '://EMOTET',
        text = {
			"Set the current {C:attention}ante{} at",
			"{X:dark_edition,C:white,s:2}^10{}.",
			"{C:attention}Destroy{} all others {C:green}Emotet{} when used",
			"Add to scored chips {C:attention}50%{} of the current {C:blue}blind chips{}",
			"{C:inactive,s:3}OMEGANUM BROKEN{}",
			"{C:inactive}Current version :{} {C:dark_edition}Emotet 0.1-Alpha{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
	G.GAME.chips = G.GAME.chips + G.GAME.blind.chips*0.5
	ease_ante(math.min(0.99e308, G.GAME.round_resets.ante ^ 10))
	for i = 1, #G.consumeables.cards do
	    if G.consumeables.cards[i].config.center.key == 'c_oiim_emotet' then
		G.consumeables.cards[i]:start_dissolve(nil, true)
	    end
	end
    end
}
local duplicate = {
    object_type = "Consumable",
    set = "Code",
    name = "Duplicate",
    key = "duplicate",
    pos = {x=2,y=2},
	config = {},
    loc_txt = {
        name = '://DUPLICATE',
        text = {
			"{C:green}Duplicate{} all {C:attention}stored{} consumables",
			"All duplicated consumables are {C:red}eternal{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
	for i = 1, #G.consumeables.cards do
	    local card = copy_card(G.consumeables.cards[i])
	    card:set_eternal(true)
	    card:add_to_deck()
	    G.consumeables:emplace(card)
	end
    end
}
local harddrive2 = {
    object_type = "Consumable",
    set = "Code",
    name = "Hard-Drive2",
    key = "harddrive2",
    pos = {x=4,y=1},
	config = {},
    loc_txt = {
        name = '://HARD-DRIVE[2]',
        text = {
			"Set the {C:attention}leftmost{} playable card on hand slots at {C:attention}consumeable{} slots",
			"{C:inactive}Unlimited use{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return #G.hand.cards ~= nil
    end,
    use = function(self, card, area, copier)
        local card = copy_card(G.hand.cards[1])
        G.hand.cards[1]:start_dissolve(nil, true)
        card:start_materialize()
        card:add_to_deck()
        G.consumeables:emplace(card)
        local card2 = create_card('Code', G.consumeables, nil,  nil, nil, nil, 'c_oiim_harddrive2', 'harddrive2')
        card2:add_to_deck()
        G.consumeables:emplace(card2)
    end
}
local ram2 = {
    object_type = "Consumable",
    set = "Code",
    name = "Ram2",
    key = "ram2",
    pos = {x=5,y=1},
	config = {},
    loc_txt = {
        name = '://RAM[2]',
        text = {
			"Set the {C:attention}leftmost{} card on consumeable slots at {C:attention}hand{} slots",
			"{C:inactive}Unlimited use{}"
        }
    },
    cost = 4,
    atlas = "codemoeditions",
    can_use = function(self, card)
        return G.consumeables.cards[1].config.center.key ~= 'c_oiim_ram2'
    end,
    use = function(self, card, area, copier)
        local card = copy_card(G.consumeables.cards[1])
        G.consumeables.cards[1]:start_dissolve(nil, true)
        card:start_materialize()
        card:add_to_deck()
        G.hand:emplace(card)
        local card2 = create_card('Code', G.consumeables, nil,  nil, nil, nil, 'c_oiim_ram2', 'ram2')
        card2:add_to_deck()
        G.consumeables:emplace(card2)
    end
}

local code_cards = {code_atlas, ransomware, hardmode, ddos, freecard, paste, cut, warp, harddrive, ram, trojan, encoding, emotet, duplicate, harddrive2, ram2}
return {name = "Code Cards",
        items = code_cards}