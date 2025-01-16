import time
import subprocess

def sync_all_wandb_logs(sync_interval=600):
    """
    Sync all offline WandB logs to the server every `sync_interval` seconds.

    Parameters:
        sync_interval (int): Time interval (in seconds) between syncs.
    """
    print(f"Starting WandB sync script. Running `wandb sync --sync-all` every {sync_interval // 60} minutes.")
    while True:
        try:
            print("Running `wandb sync --sync-all`...")
            subprocess.run(["wandb", "sync", "--sync-all"], check=True)
            print("WandB logs synced successfully.")
        except subprocess.CalledProcessError as e:
            print(f"Error while syncing: {e}. Retrying in {sync_interval // 60} minutes.")
        except Exception as e:
            print(f"Unexpected error: {e}. Retrying in {sync_interval // 60} minutes.")

        time.sleep(sync_interval)

if __name__ == "__main__":
    sync_all_wandb_logs(sync_interval=120)
