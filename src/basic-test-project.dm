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

/client
	var/counterleft = 0
	var/counterright = 0

/client/MouseDown(object, location, control, params)
	. = ..()
	var/list/modifiers = params2list(params)
	world << "down start"
	if(modifiers["right"])
		counterright++
		world << "right: down"
	if(modifiers["left"])
		counterleft++
		world << "left: down"
	world << "down end"

/client/MouseUp(object, location, control, params)
	. = ..()
	var/list/modifiers = params2list(params)
	world << "up start"
	if(modifiers["right"])
		counterright--
		world << "right: up [counterright]"
	if(modifiers["left"])
		counterleft--
		world << "left: up, [counterleft]"
	world << "up end"