#!/usr/bin/env bash

pane_bindings() {
	tmux bind-key -n M-Left select-pane -L
	tmux bind-key -n M-Down select-pane -D
	tmux bind-key -n M-Up select-pane -U
	tmux bind-key -n M-Right select-pane -R
}

window_bindings() {
	tmux bind-key -n M-S-Left previous-window
	tmux bind-key -n M-S-Right next-window

	tmux bind-key "|" split-window -h -c '#{pane_current_path}'
	tmux bind-key "-" split-window -v -c '#{pane_current_path}'
	tmux unbind '"'
	tmux unbind "%"

	tmux bind-key "C" command-prompt -p "Window Name: " "new-window -n '%%' -c '$HOME'"

	tmux unbind-key "c"
	tmux bind-key "c" new-window -n "local:$(hostname)" -c "$HOME"
}

main() {
	pane_bindings
	window_bindings
}
main
