local hyperplanet = {
    object_type = "ConsumableType",
    key = "hyperplanet",
    primary_colour = HEX("DD002F"),
    secondary_colour = HEX("DD002F"),
    collection_rows = {6,6},
    loc_txt = {
        collection = "Hyper Planet Cards",
        name = "Hyper Planet",
        label = "Hyper Planet"
    },
    shop_rate = 0.01,
    default = 'c_oiim_milkyway',
    can_stack = true,
    can_divide = true
}
SMODS.UndiscoveredSprite{
    atlas = 'exphyperplanet',
    key = 'hyperplanet',
    pos = {
        x = 0,
        y = 0,
    },
}
local exphyperplanet_atlas = {
    object_type = "Atlas",
    key = "exphyperplanet",
    path = "HyperPlanet_atlas.png",
    px = 71,
    py = 95
}
local tetrhyperplanet_atlas = {
    object_type = "Atlas",
    key = "tetrhyperplanet",
    path = "HyperPlanet_atlas2.png",
    px = 71,
    py = 95
}

-- Exponential Planet Cards

local sun = {
    object_type = "Consumable",
    set = "hyperplanet",
    name = "Sun",
    key = "sun",
    pos = {x=0,y=0},
	config = { extra = {hand = "High Card", xmult = 1.5, xchips = 1.5} },
    loc_txt = {
        name = 'Sun',
        text = {
                "(lvl:#1#) Level Up",
                "{C:dark_edition}#4#",
                "{C:dark_edition}^#2#{} Mult and",
                "{C:dark_edition}^#3#{} chips",
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {G.GAME.hands[card.ability.extra.hand].level, card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.hand } }
    end,
    cost = 6,
    atlas = "exphyperplanet",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        exp_level_up_hand(card, card.ability.extra.hand, false, card.ability.extra.xmult, card.ability.extra.xchips)
    end,
}
local betelgeuse = {
    object_type = "Consumable",
    set = "hyperplanet",
    name = "Betelgeuse",
    key = "betelgeuse",
    pos = {x=1,y=0},
	config = { extra = {hand = "Pair", xmult = 1.7, xchips = 1.5} },
    loc_txt = {
        name = 'Betelgeuse',
        text = {
                "(lvl:#1#) Level Up",
                "{C:attention}#4#",
                "{C:dark_edition}^#2#{} Mult and",
                "{C:dark_edition}^#3#{} chips",
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {G.GAME.hands[card.ability.extra.hand].level, card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.hand } }
    end,
    cost = 6,
    atlas = "exphyperplanet",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        exp_level_up_hand(card, card.ability.extra.hand, false, card.ability.extra.xmult, card.ability.extra.xchips)
    end,
}

-- Tetranional Planet Cards

local milkyway = {
    object_type = "Consumable",
    set = "hyperplanet",
    name = "Milkyway",
    key = "milkyway",
    pos = {x=0,y=0},
	config = { extra = {hand = "High Card", xmult = 2, xchips = 2} },
    loc_txt = {
        name = 'Milky Way',
        text = {
                "(lvl:#1#) Level Up",
                "{C:attention}#4#",
                "{X:dark_edition,C:red}^^#2#{} Mult and",
                "{X:dark_edition,C:red}^^#3#{} chips",
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {G.GAME.hands[card.ability.extra.hand].level, card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.hand } }
    end,
    cost = 6,
    atlas = "tetrhyperplanet",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        tetr_level_up_hand(card, card.ability.extra.hand, false, card.ability.extra.xmult, card.ability.extra.xchips)
    end,
}
local andromeda = {
    object_type = "Consumable",
    set = "hyperplanet",
    name = "Andromeda",
    key = "andromeda",
    pos = {x=1,y=0},
	config = { extra = {hand = "Pair", xmult = 2, xchips = 2} },
    loc_txt = {
        name = 'Andromeda',
        text = {
                "(lvl:#1#) Level Up",
                "{C:attention}#4#",
                "{X:dark_edition,C:red}^^#2#{} Mult and",
                "{X:dark_edition,C:red}^^#3#{} chips",
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {G.GAME.hands[card.ability.extra.hand].level, card.ability.extra.xmult, card.ability.extra.xchips, card.ability.extra.hand } }
    end,
    cost = 6,
    atlas = "tetrhyperplanet",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        tetr_level_up_hand(card, card.ability.extra.hand, false, card.ability.extra.xmult, card.ability.extra.xchips)
    end,
}


function tetr_level_up_hand(card, hand, instant, XMult, XChips)
    G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + 1)
    G.GAME.hands[hand].mult = math.max((G.GAME.hands[hand].mult ^ G.GAME.hands[hand].mult), 1)
    G.GAME.hands[hand].chips = math.max((G.GAME.hands[hand].chips ^ G.GAME.hands[hand].chips), 0)
    G.GAME.hands[hand].l_chips = math.max((G.GAME.hands[hand].l_chips ^ G.GAME.hands[hand].l_chips), 0)
    G.GAME.hands[hand].l_mult = math.max((G.GAME.hands[hand].l_mult ^ G.GAME.hands[hand].l_mult), 1)
    if not instant then 
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {mult = G.GAME.hands[hand].mult, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('talisman_eemult')
            if card then card:juice_up(0.8, 0.5) end
            return true end }))
        update_hand_text({delay = 0}, {chips = G.GAME.hands[hand].chips, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('talisman_eechip')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
        delay(1.3)
        update_hand_text({delay = 0}, {mult = 0, StatusText = true})
        update_hand_text({delay = 0}, {chips = 0, StatusText = true})
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=""})
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
    }))
end

function exp_level_up_hand(card, hand, instant, XMult, XChips)
    G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + 1)
    G.GAME.hands[hand].mult = math.max((G.GAME.hands[hand].mult ^ XMult), 1)
    G.GAME.hands[hand].chips = math.max((G.GAME.hands[hand].chips ^ XChips), 0)
    G.GAME.hands[hand].l_chips = math.max((G.GAME.hands[hand].l_chips ^ XChips), 0)
    G.GAME.hands[hand].l_mult = math.max((G.GAME.hands[hand].l_mult ^ XMult), 1)
    if not instant then 
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {mult = G.GAME.hands[hand].mult, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('talisman_emult')
            if card then card:juice_up(0.8, 0.5) end
            return true end }))
        update_hand_text({delay = 0}, {chips = G.GAME.hands[hand].chips, StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('talisman_echip')
            if card then card:juice_up(0.8, 0.5) end
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
        delay(1.3)
        update_hand_text({delay = 0}, {mult = 0, StatusText = true})
        update_hand_text({delay = 0}, {chips = 0, StatusText = true})
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=""})
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
    }))
end

local planet_cards = {hyperplanet, exphyperplanet_atlas, tetrhyperplanet_atlas, sun, betelgeuse, milkyway, andromeda}
return {name = "Planets", 
        init = function()
            
        end,
        items = planet_cards}