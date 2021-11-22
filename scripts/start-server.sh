#!/bin/bash
# Variables
export INSTANCE_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
export REGION=`curl http://169.254.169.254/latest/meta-data/placement/region`

# Attach EBS for backups
aws ec2 attach-volume --device /dev/sdf --instance-id $INSTANCE_ID --volume-id vol-094ec8741452d8ba7 --region $REGION

# Mount EBS
sudo mount /dev/nvme1n1 $HOME/backups

# Cron jobs
crontab -r
(crontab -l; echo "15 */2 * * * /home/ubuntu/create-backup.sh" ) | crontab -

# Grab latest world from EBS
$HOME/use-backup.sh

# start server
cd $HOME/Steam
./my_start_server.sh
