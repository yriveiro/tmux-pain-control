#!/usr/bin/env bash

pane_bindings() {
	tmux bind -n M-Left select-pane -L
	tmux bind -n M-Down select-pane -D
	tmux bind -n M-Up select-pane -U
	tmux bind -n M-Right select-pane -R
}

window_bindings() {
	tmux bind -n M-S-Left previous-window
	tmux bind -n M-S-Right next-window

	tmux bind "|" split-window -h
	tmux bind "-" split-window -v
	tmux unbind '"'
	tmux unbind "%"

	tmux bind "C" command-prompt -p "Window Name: " "new-window -n '%%'"
}

main() {
	pane_bindings
	window_bindings
}
main
