

local bothand = {
    object_type = "Consumable",
    set = "Spectral",
    name = "Bothand",
    key = "bothand",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Bot Hand',
        text = {
			"Convert your {C:gold}money{} into",
            "permanent {C:blue}hands{} {C:grey}(1 / 10$){}",
            "Set {C:gold}money{} to {C:gold}0${}"
        }
    },
    cost = 6,
    atlas = "bothand",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + G.GAME.dollars*0.1
        G.GAME.dollars = 0
    end,
}
local bothand_sprite = {
    object_type = "Atlas",
    key = "bothand",
    path = "c_bothand.png",
    px = 71,
    py = 95
}
local nail = {
    object_type = "Consumable",
    set = "Spectral",
    name = "Nail",
    key = "nail",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Nail',
        text = {
			"Convert your {C:gold}money{} into",
            "permanent {C:red}discards{} {C:grey}(1 / 10$){}",
            "Set {C:gold}money{} to {C:gold}0${}"
        }
    },
    cost = 6,
    atlas = "nail",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + G.GAME.dollars*0.1
        G.GAME.dollars = 0
    end,
}
local nail_sprite = {
    object_type = "Atlas",
    key = "nail",
    path = "c_nail.png",
    px = 71,
    py = 95
}
local screwdriver = {
    object_type = "Consumable",
    set = "Spectral",
    name = "Screwdriver",
    key = "screwdriver",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Screwdriver',
        text = {
			"Convert your {C:gold}money{} into",
            "permanent {C:dark_edition}jokers slot{} {C:grey}(1 / 10$){}",
            "Set {C:gold}money{} to {C:gold}0${}"
        }
    },
    cost = 6,
    atlas = "screwdriver",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.jokers.config.card_limit = G.jokers.config.card_limit + G.GAME.dollars*0.1
        G.GAME.dollars = 0
    end,
}
local screwdriver_sprite = {
    object_type = "Atlas",
    key = "screwdriver",
    path = "c_screwdriver.png",
    px = 71,
    py = 95
}
local box = {
    object_type = "Consumable",
    set = "Spectral",
    name = "Box",
    key = "box",
    pos = {x=0,y=0},
	config = {},
    loc_txt = {
        name = 'Box',
        text = {
			"Convert your {C:gold}money{} into",
            "permanent {C:attention}consumeables slot{} {C:grey}(1 / 10$){}",
            "Set {C:gold}money{} to {C:gold}0${}"
        }
    },
    cost = 6,
    atlas = "box",
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + G.GAME.dollars*0.1
        G.GAME.dollars = 0
    end,
}
local box_sprite = {
    object_type = "Atlas",
    key = "box",
    path = "c_box.png",
    px = 71,
    py = 95
}

return {name = "Spectrals", 
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
        items = {bothand_sprite, nail_sprite, screwdriver_sprite, box_sprite, bothand, nail, screwdriver, box}}
