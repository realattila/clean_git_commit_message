#!/bin/bash

# Display a message to the user
echo "============================================================"
echo "   Script to setup git-cmg alias by RealAttila"
echo "============================================================"

# Step 1: Clean up any existing 'cmg' alias from Git configuration
echo "Cleaning up any existing 'cmg' alias..."
git config --global --unset alias.cmg
if [ $? -eq 0 ]; then
    echo "Existing 'cmg' alias removed successfully."
else
    echo "No 'cmg' alias found to remove."
fi

# Step 2: Check if ~/scripts directory exists, create it if not
echo "Checking if ~/scripts directory exists..."
if [ ! -d "$HOME/scripts" ]; then
    echo "Directory ~/scripts does not exist. Creating it now..."
    mkdir -p "$HOME/scripts"
else
    echo "Directory ~/scripts already exists."
fi

# Step 3: Copy git-cmg.sh to ~/scripts
echo "Copying git-cmg.sh to ~/scripts..."
cp -f "git-cmg.sh" "$HOME/scripts/git-cmg.sh"
if [ $? -eq 0 ]; then
    echo "git-cmg.sh copied successfully."
else
    echo "Failed to copy git-cmg.sh. Please check the file path."
    exit 1
fi

# Step 4: Grant execute permission to git-cmg.sh
echo "Granting execute permission to git-cmg.sh..."
chmod +x "$HOME/scripts/git-cmg.sh"
if [ $? -eq 0 ]; then
    echo "Execute permission granted successfully."
else
    echo "Failed to grant execute permission. Please check your permissions."
    exit 1
fi

# Step 5: Add git-cmg alias to Git configuration
echo "Adding 'git-cmg' alias to Git configuration..."
git config --global alias.cmg "!\"$HOME/scripts/git-cmg.sh\""
if [ $? -eq 0 ]; then
    echo "git-cmg alias added successfully!"
else
    echo "Failed to add git-cmg alias. Please check your Git installation."
    exit 1
fi

# Step 6: Verify the alias was added successfully
echo "Verifying the 'git-cmg' alias..."
git config --global --get alias.cmg
if [ $? -eq 0 ]; then
    echo "Alias 'git-cmg' is correctly set."
else
    echo "Failed to retrieve alias. Please troubleshoot."
    exit 1
fi

echo "============================================================"
echo "   Setup complete. Press any key to exit."
echo "============================================================"
read -n 1 -s
