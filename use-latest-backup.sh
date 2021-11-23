#!/bin/bash

WORLDS=$HOME/.config/unity3d/IronGate/Valheim
NEW_BACKUP=$(ls -t $HOME/backups | head -n1)

# Move newest backup into worlds
cp -r $HOME/backups/$NEW_BACKUP $WORLDS

# Remove existing world files
sudo rm -rf $WORLDS/worlds
sudo mv $WORLDS/$NEW_BACKUP $WORLDS/worlds
