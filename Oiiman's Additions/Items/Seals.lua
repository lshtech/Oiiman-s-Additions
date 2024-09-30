local pinkseal = {
    object_type = "Seal",
    set = "Seal",
    name = "Pinkseal",
    key = "pinkseal",
    pos = {x=0,y=0},
	config = {},
    badge_colour = HEX("f93cf9"),
    loc_txt = {
        label = 'Pink Seal',
        name = 'Pink Seal',
        text = {
			"Creates 2 {C:attention}copies{} of the {C:attention}leftmost{}",
            "playable card when playing it. Creates",
	    "one {C:attention}copy{} when retriggered"
        }
    },
    cost = 6,
    atlas = "pinkseal",
    can_use = function(self, card)
        return true
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            	    local card = copy_card(G.hand.cards[1])
            	    card:start_materialize()
            	    card:add_to_deck()
            	    G.hand:emplace(card)
                return true end }))
	end
    end
}
local pinkseal_sprite = {
    object_type = "Atlas",
    key = "pinkseal",
    path = "pink_seal.png",
    px = 71,
    py = 95
}
local blankseal = {
    object_type = "Seal",
    set = "Seal",
    name = "Blankseal",
    key = "blankseal",
    pos = {x=0,y=0},
	config = {},
    badge_colour = HEX("f0f0f0"),
    loc_txt = {
        label = 'Blank Seal',
        name = 'Blank Seal',
        text = {
			"When only this card is {C:attention}played{}",
            "Creates 3 {C:attention}item cards{}"
        }
    },
    cost = 6,
    atlas = "blankseal",
    can_use = function(self, card)
        return true
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if #context.full_hand == 1 then
                create_consumable("Itemcard")
                create_consumable("Itemcard")
                create_consumable("Itemcard")
            end
	end
    end
}
local blankseal_sprite = {
    object_type = "Atlas",
    key = "blankseal",
    path = "blank_seal.png",
    px = 71,
    py = 95
}
local planetseal = {
    object_type = "Seal",
    set = "Seal",
    name = "Planetseal",
    key = "planetseal",
    pos = {x=0,y=0},
	config = { extra = {xmult = 0.1, xchips = 10} },
    badge_colour = HEX("3cdff9"),
    loc_txt = {
        label = 'Planet Seal',
        name = 'Planet Seal',
        text = {
			"When triggered, adds {C:red}#1#{} mult",
            "and {C:blue}#2#{} chips on the {C:attention}last hand played{}"
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.xmult, self.config.extra.xchips} }
    end,
    cost = 6,
    atlas = "planetseal",
    can_use = function(self, card)
        return true
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play then
	    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                planetseal_level_up_hand(card, false, self.config.extra.xmult, self.config.extra.xchips)
		return true end }))
	end
    end
}
local planetseal_sprite = {
    object_type = "Atlas",
    key = "planetseal",
    path = "planet_seal.png",
    px = 71,
    py = 95
}

function planetseal_level_up_hand(card, instant, XMult, XChips)
    if G.GAME.last_hand_played ~= nil then
	local lasthand = G.GAME.last_hand_played
        G.GAME.hands[lasthand].level = math.max(0, G.GAME.hands[lasthand].level + 0)
        G.GAME.hands[lasthand].mult = math.max((G.GAME.hands[lasthand].mult + XMult), 1)
        G.GAME.hands[lasthand].chips = math.max((G.GAME.hands[lasthand].chips + XChips), 0)
        G.GAME.hands[lasthand].l_chips = math.max((G.GAME.hands[lasthand].l_chips + XChips), 0)
        G.GAME.hands[lasthand].l_mult = math.max((G.GAME.hands[lasthand].l_mult + XMult), 1)
        if not instant then 
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                G.TAROT_INTERRUPT_PULSE = true
                return true end }))
            update_hand_text({delay = 0}, {mult = XMult, StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                return true end }))
            update_hand_text({delay = 0}, {chips = XChips, StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                G.TAROT_INTERRUPT_PULSE = nil
                return true end }))
            delay(1.3)
            update_hand_text({delay = 0}, {mult = 0, StatusText = true})
            update_hand_text({delay = 0}, {chips = 0, StatusText = true})
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=""})
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function() check_for_unlock{type = 'upgrade_hand', hand = lasthand, level = 0} return true end)
        }))
    end
end

local seals = {pinkseal_sprite, pinkseal, blankseal_sprite, blankseal, planetseal_sprite, planetseal}
return {name = "Seal",
        items = seals}