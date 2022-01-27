#!/usr/bin/env bash

pane_bindings() {
	tmux bind -n M-Left select-pane -L
	tmux bind -n M-Down select-pane -D
	tmux bind -n M-Up select-pane -U
	tmux bind -n M-Right select-pane -R

	tmux bind -r "<" swap-pane -d -t -1
	tmux bind -r ">" swap-pane -d -t +1
}

window_bindings() {
	tmux bind -n M-S-Left previous-window
	tmux bind -n M-S-Right next-window

	tmux bind -r ";" swap-window -d -t -1
	tmux bind -r "," swap-window -d -t +1

	tmux bind "|" split-window -h
	tmux bind "-" split-window -v
	tmux bind "_" split-window -vv
	tmux unbind '"'
	tmux unbind "%"

	tmux bind "C" command-prompt -p "Window Name: " "new-window -n '%%' -c #{pane_current_path}"
}

main() {
	pane_bindings
	window_bindings
}

main
