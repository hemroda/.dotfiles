#!/bin/bash

session="MaavitaRB"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window "Vim"
tmux send-keys -t $session:$window "marb && nvim ." C-m

window=1
tmux new-window -t $session:$window -n "Server"
tmux send-keys -t $session:$window "marb && npm run start" C-m

window=2
tmux new-window -t $session:$window -n "Console"
tmux send-keys -t $session:$window "marb && berc" C-m

window=3
tmux new-window -t $session:$window -n "CLI"
tmux send-keys -t $session:$window "marb" C-m


tmux attach-session -t $session

