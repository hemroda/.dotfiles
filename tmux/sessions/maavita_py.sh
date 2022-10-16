#!/bin/bash

session="MaavitaPY"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window "Vim"
tmux send-keys -t $session:$window "mapy && nvim ." C-m

window=1
tmux new-window -t $session:$window -n "Server"
tmux send-keys -t $session:$window "mapy && source .env/bin/activate" C-m
tmux send-keys -t $session:$window "mapys && python manage.py runserver" C-m


window=2
tmux new-window -t $session:$window -n "Tailwind"
tmux send-keys -t $session:$window "mapy && source .env/bin/activate" C-m
tmux send-keys -t $session:$window "mapys && python manage.py tailwind start" C-m

window=3
tmux new-window -t $session:$window -n "CLI"
tmux send-keys -t $session:$window "mapy" C-m


tmux attach-session -t $session
