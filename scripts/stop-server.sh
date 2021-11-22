#!/bin/bash

# Remove cron jobs
crontab -r

# Create backup
$HOME/create-backup.sh

# Kills server session
tmux kill-session -t server

# Stop instance
aws stop-instances --instance-ids $INSTANCE_ID
