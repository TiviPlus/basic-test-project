/*
	These are simple defaults for your project.
 */

/world
	fps = 60		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = 6		// show up to 6 tiles outward from center (13x13 view)


// Make objects move 8 pixels per tick when walking

mob
	step_size = 8

obj
	step_size = 8

/obj/planemaster
	appearance_flags = PLANE_MASTER
	icon = 'icons/turfs.dmi'
	icon_state = "white"

/obj/planemaster/world
	plane = 3
	render_target = "*mob"

/obj/planemaster/lighting
	plane = 4
	render_target = "*lighting"

/obj/planemaster/all
	plane = 5

/client/verb/test()

	var/mob/M = new(mob.loc)
//	M.render_source = "*mob"
	var/obj/O = new(mob.loc)
//	O.render_target = "*mob"
	O.plane = 4
	O.color = "#FF0000"
	O.blend_mode = BLEND_ADD
	M.plane = 3
	//O.alpha = 128
	O.icon = 'icons/turfs.dmi'
	O.icon_state = "white"

	screen += new /obj/planemaster/world()
	screen += new /obj/planemaster/lighting()
	screen += new /obj/planemaster/all()

	var/obj/all = new()
	all.render_source = "*mob"
	all.layer = 3
	all.plane = 5
	all = new /obj()
	all.render_source = "*lighting"
	all.layer = 4
	all.plane = 5
	all.blend_mode = BLEND_MULTIPLY

/client/verb/cycle()
	var/obj/O = locate(/obj)
	if(O.blend_mode == BLEND_MULTIPLY)
		O.blend_mode = BLEND_OVERLAY
		world << "blend overlay"
	else
		O.blend_mode = BLEND_MULTIPLY
		world << "blend multiply"