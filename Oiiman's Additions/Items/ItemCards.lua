local random_editions = {
	'foil',
	'holo',
	'polychrome',
	'cry_mosaic',
	'cry_astral',
	'cry_blur'
}


local itemcard = {
    object_type = "ConsumableType",
    key = "Itemcard",
    primary_colour = HEX("E8EB95"),
    secondary_colour = HEX("E8EB95"),
    collection_rows = {4,4,4}, -- 4 pages for all code cards
    loc_txt = {
        collection = "Item Cards",
        name = "Item",
        label = "Item"
    },
    shop_rate = 1,
    default = 'c_greenbeer',
    can_stack = true,
    can_divide = true
}
local itemcard_atlas = {
    object_type = "Atlas",
    key = "itemcardatlas",
    path = "itemcard_atlas.png",
    px = 71,
    py = 95
}
local greenbeer = {
    object_type = "Consumable",
    set = "Itemcard",
    name = "Greenbeer",
    key = "greenbeer",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Green Beer',
        text = {
			"+1 temporary {C:blue}hand{}",
        }
    },
    cost = 2,
    atlas = "itemcardatlas",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
    end
}
local goldenbeer = {
    object_type = "Consumable",
    set = "Itemcard",
    name = "Goldenbeer",
    key = "goldenbeer",
    pos = {x=1,y=0},
	config = {},
    loc_txt = {
        name = 'Golden Beer',
        text = {
			"{C:gold}+5${}",
        }
    },
    cost = 2,
    atlas = "itemcardatlas",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.dollars = G.GAME.dollars + 5
    end
}
local waterbottle = {
    object_type = "Consumable",
    set = "Itemcard",
    name = "Waterbottle",
    key = "waterbottle",
    pos = {x=2,y=0},
	config = {},
    loc_txt = {
        name = 'Water Bottle',
        text = {
			"+1 temporary {C:red}discard{}",
        }
    },
    cost = 2,
    atlas = "itemcardatlas",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
    end
}
local pizzaslice = {
    object_type = "Consumable",
    set = "Itemcard",
    name = "Pizzaslice",
    key = "pizzaslice",
    pos = {x=3,y=0},
	config = {},
    loc_txt = {
        name = 'Pizza Slice',
        text = {
			"+1 {C:attention}tarot{} card",
        }
    },
    cost = 2,
    atlas = "itemcardatlas",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'pizzaslice')
        card:add_to_deck()
        G.consumeables:emplace(card)
    end
}
local backpack = {
    object_type = "Consumable",
    set = "Itemcard",
    name = "Backpack",
    key = "backpack",
    pos = {x=0,y=1},
	config = {},
    loc_txt = {
        name = 'Backpack',
        text = {
			"+1 {C:attention}consumeable{} slot",
        }
    },
    cost = 2,
    atlas = "itemcardatlas",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
	G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
    end
}
local monster = {
    object_type = "Consumable",
    set = "Itemcard",
    name = "Monster",
    key = "monster",
    pos = {x=1,y=1},
	config = {},
    loc_txt = {
        name = 'Monster',
        text = {
			"Add a random {C:dark_edition}edition{} on all held {C:blue}planet cards{}.",
			"{C:inactive}(foil, holo, polychrome, mosaic, astral, blur){}"
        }
    },
    cost = 2,
    atlas = "itemcardatlas",
    can_use = function(self, card)
        return #G.consumeables.cards >= 1
    end,
    use = function(self, card, area, copier)
	for i = 1, #G.consumeables.cards do
	    if G.consumeables.cards[i].config.center.set == 'Planet' then
		G.consumeables.cards[i]:set_edition({[random_editions[pseudorandom('disc1', 1, #random_editions)]] = true}, true, true)
	    end
	end
    end
}

local item_cards = {itemcard, itemcard_atlas, greenbeer, goldenbeer, waterbottle, pizzaslice, backpack, monster}
return {name = "Item Cards",
        items = item_cards}
