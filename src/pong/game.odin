package pong

import "../engine"
import "core:fmt"

init_game :: proc() -> bool {
	app_info: engine.AppInfo
	app_info.width = 640
	app_info.height = 480
	app_info.title = "Pong!"
	app_info.render_fps = 60

	if !engine.init_app(app_info) {
		fmt.println("Unable to init game!")
	}

	engine.run_app()

	return true
}

state_switcher :: proc() {

}

