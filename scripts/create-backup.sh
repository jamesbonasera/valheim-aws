#!/bin/bash

# Check for max backups
if [ $(ls -d $HOME/backups/2* | wc -l) -ge 20 ]
then old=$(ls -drt $HOME/backups/2* | head -n1)
sudo rm -rf $old
fi

# Copy world data to backups folder
sudo cp -r $HOME/.config/unity3d/IronGate/Valheim/worlds $HOME/backups

# Rename world folder based on creation date
sudo mv $HOME/backups/worlds $HOME/backups/$(date +"%Y-%m-%d-%I%M%S")
