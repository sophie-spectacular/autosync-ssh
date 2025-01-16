## setup sync

1. clone this into a directory one level above the directory you are working with
2. edit sync.sh with the correct parameters at the top
3. edit sync_loop.sh to the desired refresh interval (in seconds, in the line that says sleep)
4. navigate to the base directory which contains both scripts/ folder and target/ folder
4. run: chmod +x scripts/sync_loop.sh
5. to run this script in background forever, run: nohup scripts/sync_loop.sh > scripts/sync.log 2>&1 &
6. to kill the script or make edits, run: ps -x and take note of the PID of the job with above CMD
7. run: kill -9 [PID]

## setup wandb sync
the reason this is needed is wandb should report current metrics as the training runs such that they can be monitored/crash reports can be sent. however, only the login nodes of clusters are connected to the internet, so this is a work around.
1. move wandb_sync.py to the directory in which all of your code is/where the wandb folder will be saved to (but not in the wandb folder)
2. run: nohup python wandb_sync.py >> wandb_sync_logs.out 2>&1 &

## setup aliasing
*note, this may be subject to specifics depending on environment setup in remote