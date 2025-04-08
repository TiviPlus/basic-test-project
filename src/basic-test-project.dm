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

/client/Click(object, location, control, params)
	. = ..()
	var/mousepos = winget(src, "map", "mouse-pos")
	var/iconsize = winget(src, "map", "icon-size")
	var/size = winget(src, "map", "size")
	src << "Click: " + size + " " + mousepos + " " + iconsize

obj
	step_size = 8
