register_blueprint "svfx_base"
{
    data = {
        svfx = 1,
    },
	callbacks = {
		on_load = [[
			function ( self )
				world:destroy( self )
			end
		]],
    },
}
 
register_blueprint "svfx_blerh"{blueprint = "svfx_base",}
register_blueprint "svfx_snarl"{blueprint = "svfx_base",}
register_blueprint "svfx_growl"{blueprint = "svfx_base",}
register_blueprint "svfx_bellow"{blueprint = "svfx_base",}
register_blueprint "svfx_grumble"{blueprint = "svfx_base",}
register_blueprint "svfx_howl"{blueprint = "svfx_base",}
register_blueprint "svfx_roar"{blueprint = "svfx_base",}
register_blueprint "svfx_blip"{blueprint = "svfx_base",}
register_blueprint "svfx_warble"{blueprint = "svfx_base",}
register_blueprint "svfx_trill"{blueprint = "svfx_base",}
register_blueprint "svfx_clank"{blueprint = "svfx_base",}
register_blueprint "svfx_kachunk"{blueprint = "svfx_base",}
register_blueprint "svfx_chirp"{blueprint = "svfx_base",}
register_blueprint "svfx_chunk"{blueprint = "svfx_base",}
register_blueprint "svfx_open"{blueprint = "svfx_base",}
register_blueprint "svfx_close"{blueprint = "svfx_base",}
register_blueprint "svfx_ding"{blueprint = "svfx_base",}
register_blueprint "svfx_buzz"{blueprint = "svfx_base",}
register_blueprint "svfx_buzzar"{blueprint = "svfx_base",}
register_blueprint "svfx_chatter"{blueprint = "svfx_base",}
register_blueprint "svfx_whirr"{blueprint = "svfx_base",}
register_blueprint "svfx_hiss"{blueprint = "svfx_base",}
register_blueprint "svfx_skitter"{blueprint = "svfx_base",}
register_blueprint "svfx_boom"{blueprint = "svfx_base",}
register_blueprint "svfx_crash"{blueprint = "svfx_base",}
register_blueprint "svfx_ching"{blueprint = "svfx_base",}
register_blueprint "svfx_death"{blueprint = "svfx_base",}

sound_vis_table = {
    idle = {},
    step = {},
    die = {},
}

for _,bp in ipairs( blueprints ) do
    cur = bp
    while true do
        if cur.sound and cur.sound.step then
            sound_vis_table.step[bp.id] = cur.sound.step
            break
        end
        if cur.blueprint then
            cur = blueprints[cur.blueprint]
        else
            break
        end
    end
    
    cur = bp
    while true do
        if cur.sound and cur.sound.idle then
            sound_vis_table.idle[bp.id] = cur.sound.idle
            break
        end
        if cur.blueprint then
            cur = blueprints[cur.blueprint]
        else
            break
        end
    end
    
    
    cur = bp
    while true do
        if cur.sound and cur.sound.die then
            sound_vis_table.die[bp.id] = cur.sound.die
            break
        end
        if cur.blueprint then
            cur = blueprints[cur.blueprint]
        else
            break
        end
    end
end

svfx_table = {
    former_idle = "svfx_base",
    fiend_idle = "svfx_hiss",
    kerberos_idle = "svfx_grumble",
    reaver_idle = "svfx_growl",
    archreaver_idle = "svfx_snarl",
    
    medusa_idle = "svfx_howl",
    warlock_idle = "svfx_roar", --"roar"  is not actually too descriptive of the sound, but whatever
    ravager_idle = "svfx_bellow",
    
    
    drone_idle = "svfx_blip",
    sentry_bot_idle = "svfx_chirp",
    
    guardian_idle = "svfx_trill",
    sentinel_idle = "svfx_warble",
    
    watcher_idle = nil, --doesn't actually have a sound?
    turret_idle = "svfx_whirr",
    cryomancer_idle = "svfx_roar",
    ancient_idle = nil,
    cri_bot_idle = "svfx_buzzar",
    
    tank_mech_idle = nil,
    boss_idle = nil,
    butcher_idle = nil,
    
    cri_marine_idle = "svfx_chatter", --Chatter
        
    --STEP
    security_bot_step = "svfx_clank",
    cri_bot_step = "svfx_kachunk",
    tank_mech_step = "svfx_clank",
    boss_step = "svfx_kachunk",
    sentry_bot_step = nil, --TODO: Skitter -- very silent, inaudible under music - maybe don't add
    
    --OTHER
    door_open = "svfx_open", --just Open? or Shhhk / Chunk
    door_close = nil, --just Close? or Ksssh
    summon = "svfx_ching", --
    explosion = nil, --world:play_sound is sometimes used for explosions, but more complex stuff needed for like attack explosions - not worth the effort
    vending_hit_reward = "svfx_ding", --Ding?
    
    chaingun_spin_loop = nil, --obviously can't portray the looping, and does this even play out of LOS?
    hyperblaster_spin_loop = nil,
    
    boss_die_stage2 = nil,
    boss_target = nil,
    --out of vision hits/criticals could also use an indicator maybe ... given that out-of-vision cheesing can use that
    --but implementing that properly takes effort, I imagine
    
    
    --DIE
    die="svfx_death", --overrides 'die' mappings, because matches the 'typ' ... gets a bit too detailed maybe
    -- gibbed=nil,
    former_die=nil,
    drone_die=nil,
    fiend_die=nil,
    sentry_bot_die=nil,
    security_bot_die=nil,
    reaver_die=nil,
    archreaver_die=nil,
    kerberos_die=nil,
    medusa_die=nil,
    ravager_die=nil,
    cri_marine_die=nil,
    cri_bot_die=nil,
    guardian_die=nil,
    sentinel_die=nil,
    warlock_die=nil,
    watcher_die=nil,
    cryomancer_die=nil,
    ancient_die=nil,
    butcher_die=nil,
    tank_mech_die=nil,
    
}

svfx_modulo = 3
function svfx_from_entity(e,typ)
    local texture
    if svfx_table[typ] then --when world:play_sound uses the sound name directly, e.g. "sentry_bot_idle" instead of "idle" and getting it from entity.sound.idle
        texture = svfx_table[typ]
    elseif e then
        texture = sound_vis_table[typ][world:get_id( e )]
        if texture == nil then
            return
        end
        texture = svfx_table[texture]
    else 
        return --somewhy no entity?
    end
    if texture == nil then
        return
    end
    local pos = e:get_position()
    local player = world:get_player()
    local p =  player:get_position()
    local delta = pos - p
    local level = world:get_level()
    if svfx_modulo < 21 and not level:coord_see_entity( pos, player) then
        svfx_modulo = svfx_modulo + 1
        p.x = p.x + svfx_modulo%3-1
        p.y = p.y + math.floor(svfx_modulo/3)%3-1
        local svfx = level:place_entity( texture, p )
        -- local svfx = ui:spawn_fx( nil, texture, nil, p ) --can't dynamically set gfx values?
        local angle = math.atan2(delta.x, delta.y)+(math.random()-0.5)*0.3 -- ~9 degrees random variation
        local offset = math.max(math.min(10,2+math.sqrt(delta.x*delta.x+delta.y*delta.y)/5),3)
        local ax = math.sin(angle)
        local yx = math.cos(angle)
        -- local svfx = ui:spawn_fx( nil, texture, nil, p )
        --I wonder if queue reduces hitching?
        -- ui:run_visual_event( svfx, "set_value", "svfx", { component = "point_generator", key = "position",  value = vec3(offset*ax,3,offset*yx-1.5) } )
        -- ui:run_visual_event( svfx, "set_value", "svfx", { component = "particle_transform", key = "force",  value = vec3(-ax*4.5,-1,-yx*4.5), } )
        ui:queue_visual_event( 0.001,svfx, "set_value", "svfx", { component = "point_generator", key = "position",  value = vec3(offset*ax,3,offset*yx-1.5) } )
        ui:queue_visual_event( 0.001,svfx, "set_value", "svfx", { component = "particle_transform", key = "force",  value = vec3(-ax*4.5,-1,-yx*4.5), } )
    end
end

blueprints["bot"].callbacks = {
    --could also put this in enemy_helper, if there were anything not-bot with step sound
    on_move = [[
			function ( self, entity, epos, rel )
                svfx_from_entity(self,"step")
			end
		]]
}
        
old_wps = nil        
function play_sound_wrap(...)
    local args = { ... }
    local entity = args[3]
    if entity then
        if (args[2] == "idle" or args[2] == "sentry_bot_idle") then
            svfx_from_entity(entity,"idle")
        elseif args[2] == "door_open" then
            svfx_from_entity(entity,"door_open")
        elseif args[2] == "door_close" then -- just for infernal lock maybe?
        elseif args[2] == "summon" then
            svfx_from_entity(entity,"summon")
        end
    end
    return old_wps(...)
end

register_blueprint "sound_vis_enemy_helper"
{
	flags = { EF_NOPICKUP, }, 
	callbacks = {
		on_die = [[
			function ( self,entity )
                svfx_from_entity(entity,"die")
				world:mark_destroy( self )
			end
		]],
	},
}

register_blueprint "sound_vis_helper"
{
	flags = { EF_NOPICKUP },
    data = {
    },
    callbacks = {
        on_enter_level = [=[
            function ( self, entity, reenter )
                if play_sound_wrap ~= world.play_sound then
                    old_wps = world.play_sound
                    world.play_sound = play_sound_wrap
                end

            end
        ]=],
        on_action = [=[
            function ( self, entity )
                svfx_modulo = 3
                for v in world:get_level():entities() do
                    if v.data and v.data.svfx then
                        if v.data.svfx == 1 then
                            v.data.svfx = 2
                        else
                            world:destroy(v)
                        end
                    end
                end
            end
            
        ]=],
		on_pre_command = [[
			function ( self, entity, command, weapon )
                for v in world:get_level():entities() do
                    if v.data and v.data.svfx then
                        if v.data.svfx == 1 then
                            v.data.svfx = 2
                        else
                            world:destroy(v)
                        end
                    end
                end
			end
		]],
        on_load = [=[
            function ( self, entity, reenter )
                if play_sound_wrap ~= world.play_sound then
                    old_wps = world.play_sound
                    world.play_sound = play_sound_wrap
                end
            end
        ]=],
    },
}
world.register_on_entity( function(x) if x.data and x.data.ai and x.data.ai.group == "player" then x:attach("sound_vis_helper") end end)
world.register_on_entity( function(x) if x.data and x.data.ai then x:attach("sound_vis_enemy_helper") end end)