import subprocess
import webbrowser
import time

# Run the "cloudflared tunnel login" command
result = subprocess.run(['cloudflared', 'tunnel', 'login'], capture_output=True, text=True)

# Check if the output contains a URL
if 'https://' in result.stdout:
    # If a URL is present, open it in the default web browser
    url = result.stdout.strip()
    webbrowser.open(url)

    # Wait for user to authenticate
    start_time = time.time()
    while True:
        time.sleep(5)  # Wait for 5 seconds
        check_result = subprocess.run(['cloudflared', 'tunnel', 'whoami'], capture_output=True, text=True)
        if 'Logged in as' in check_result.stdout:
            break
        elif time.time() - start_time >= 600:  # Timeout after 10 minutes
            print("Authentication timed out after 10 minutes.")
            exit(1)

# Run the "cloudflared tunnel create test" command after successful authentication
subprocess.run(['cloudflared', 'tunnel', 'create', 'test'])
