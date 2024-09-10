# Start a new tmux session#!/bin/bash

# Setup ngrok and redis
tmux new-session -d -s ngrok-n-redis
tmux split-window -h -t ngrok-n-redis:0
tmux select-pane -t ngrok-n-redis:0.0
sleep .5
tmux send-keys 'ngrok-start'
tmux select-pane -t ngrok-n-redis:0.1
sleep .5
tmux send-keys 'redis-server'

# Start a new tmux session with a single window
tmux new-session -d -s celery

# Split the window into panes
tmux split-window -h -t celery:0
tmux split-window -v -t celery:0
tmux select-pane -t celery:0.0
tmux split-window -v -t celery:0

# Run the first celery server in the first pane
tmux select-pane -t celery:0.0
tmux send-keys 'cdpb' C-m
tmux send-keys 'pipenv shell' C-m
sleep .5
tmux send-keys 'pa-celery-1' C-m

# Run the second celery server in the second pane
tmux select-pane -t celery:0.1
tmux send-keys 'cdpb' C-m
tmux send-keys 'pipenv shell' C-m
sleep .5
tmux send-keys 'pa-celery-2' C-m

# Run the third celery server in the third pane
tmux select-pane -t celery:0.2
tmux send-keys 'cdpb' C-m
tmux send-keys 'pipenv shell' C-m
sleep .5
tmux send-keys 'pa-celery-3' C-m

# Run the fourth celery server in the fourth pane
tmux select-pane -t celery:0.3
tmux send-keys 'cdpb' C-m
tmux send-keys 'pipenv shell' C-m
sleep .5
tmux send-keys 'pa-celery-4' C-m

# Stqart the development environment
tmux new-session -d -s development
tmux split-window -h -t development:0
tmux split-window -v -t development:0
tmux select-pane -t development:0.0
tmux split-window -v -t development:0

# Start the backend
tmux send-keys 'cdpb' C-m
tmux send-keys 'pipenv shell' C-m
sleep .5
tmux send-keys 'pmr' C-m

# Start the frontend
tmux select-pane -t development:0.1
tmux send-keys 'cdpf' C-m
tmux send-keys 'nvm use 15' C-m
tmux send-keys 'npm start' C-m

# Start the dev environment
tmux select-pane -t development:0.2
tmux send-keys 'cdpp' C-m
tmux send-keys 'nvim .' C-m

# Open up the servers
tmux new-session -d -s servers

# Attach to the tmux session
tmux attach-session -t development

