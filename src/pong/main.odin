package pong
import "../engine"

main :: proc() {
	if !init_game() {
		return
	}
}

