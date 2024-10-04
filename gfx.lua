nova.require "data/lua/gfx/common"

register_gfx_blueprint "pgroup_test"
{
	particle_group = {
		quota = 32 * 1024,
		layer = "fx",
		settings = {
			common_up       = vec3(0,0,1), --felt like I needed to fiddle with these to get the particles to face up
			common_dir      = vec3(0,-1,0), --and I couldn't figure out a way to have the particles face the camera
			accurate_facing = true,
            orientation     = PS_PERPENDICULAR_COMMON,
			origin          = PS_CENTER,
		},
	},
}

register_gfx_blueprint "svfx_base"{
    tag = "svfx",
	equip = {},
    persist = true,
	point_generator = {
		type      = "point",
		direction = vec3(.0,1.0,.0),
        position = vec3(0.0,3.0,0.0),
		extents   = vec3(0,0,0),
	},
	particle = {
		material       = "svis_textures/blerh",
		group_id       = "pgroup_test",
	},
	particle_emitter = {
		quota    = 1,
		target   = 1,
        angle    = 15,
		rate     = 1000,
        color    = vec4(0.82,0.46,0.06,1.0),
		size     = vec2(1,1),
		velocity = { 0.75,0.95 },
		lifetime = { 0.75, 0.95 },
	},
    
	lifetime = {
		duration = 0.1,
	},
	particle_fade = {
		fade_in = .6,
		fade_out = .6,
        -- size_fade = true,
	},
	particle_transform = {
		force = vec3(0.1,-1,0),
	},
}

register_gfx_blueprint "svfx_blerh"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/blerh",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_snarl"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/snarl",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_growl"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/growl",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_bellow"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/bellow",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_grumble"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/grumble",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_howl"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/howl",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_roar"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/roar",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_blip"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/blip",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_warble"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/warble",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_trill"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/trill",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_clank"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/clank",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_kachunk"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/kachunk",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_chirp"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/chirp",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_chunk"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/chunk",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_open"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/open",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_close"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/close",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_ding"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/ding",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_buzz"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/buzz",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_buzzar"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/buzzar",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_chatter"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/chatter",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_whirr"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/whirr",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_hiss"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/hiss",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_skitter"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/skitter",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_boom"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/boom",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_crash"{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/crash",
            group_id       = "pgroup_test",
        },}
register_gfx_blueprint "svfx_ching"{
    blueprint = "svfx_base",
    particle = {
        material       = "svis_textures/ching",
        group_id       = "pgroup_test",
    },}
register_gfx_blueprint "svfx_death"{
    blueprint = "svfx_base",
    particle = {
        material       = "svis_textures/death",
        group_id       = "pgroup_test",
    },}