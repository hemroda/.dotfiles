#!/bin/bash

session="MaavitaJS"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window "Vim"
tmux send-keys -t $session:$window "majsb && vim ." C-m

window=1
tmux new-window -t $session:$window -n "Server"
tmux send-keys -t $session:$window "majsb && npm run start" C-m


window=2
tmux new-window -t $session:$window -n "CLI"
tmux send-keys -t $session:$window "majsb" C-m


tmux attach-session -t $session

