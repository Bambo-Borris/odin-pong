package engine

import "core:strings"
import "vendor:raylib"

AppInfo :: struct {
	width:                 i32,
	height:                i32,
	title:                 string,
	render_fps:            i32,
	fixed_fps:             i32,
	windowed_fullscreen:   bool,
	switch_state_callback: proc(),
}

delta_time: f32

@(private = "file")
state_switcher: proc()

init_app :: proc(app_info: AppInfo) -> bool {
	when ODIN_DEBUG {
		raylib.SetExitKey(raylib.KeyboardKey.KEY_NULL)
	}
	raylib.InitWindow(
		app_info.width,
		app_info.height,
		strings.unsafe_string_to_cstring(app_info.title),
	)
	raylib.SetTargetFPS(app_info.render_fps)

	state_switcher = app_info.switch_state_callback
	return true
}

run_app :: proc() {
	for !raylib.WindowShouldClose() {
		raylib.BeginDrawing()
		raylib.ClearBackground(raylib.BLACK)
		raylib.DrawRectangle(10, 10, 200, 200, raylib.WHITE)
		// currentState->fnPtrRender()
		raylib.EndDrawing()

		delta_time = raylib.GetFrameTime()
	}
}

