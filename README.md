# Git Commit Message Generator and Validator

Improve your Git commit history with this handy Bash script and Git commit message hook. This tool helps you generate consistent commit messages and ensures they follow your desired format. Maintain a cleaner and more organized project history for better collaboration.

## Prerequisites

### Windows Users

1. **Install Git for Windows**:

   - Download and install Git from the official Git website: [https://git-scm.com/](https://git-scm.com/).
   - During installation, ensure that the **Git Bash** option is selected. This will allow you to run Bash scripts on Windows.

2. **Install Git Bash** (if not already included with the Git installation):
   - Git Bash provides a Bash emulation used to run the script.
   - You can install Git Bash as part of the Git installation or as a separate download from: [https://gitforwindows.org/](https://gitforwindows.org/).

### Linux/macOS Users

1. **Install Git**:

   - **Linux**: Install Git using your package manager. For example:
     ```bash
     sudo apt-get install git    # For Ubuntu/Debian-based systems
     sudo yum install git        # For Red Hat/CentOS-based systems
     ```
   - **macOS**: Git is often pre-installed on macOS. If it's not, you can install it using Homebrew:
     ```bash
     brew install git
     ```

2. **Bash Shell**:
   - macOS and Linux usually come with Bash pre-installed, so no additional installation is required.

## Setup

### Windows, Linux, and macOS Users

1. **Clone or Download the Repository**:

   - Clone this repository and the setup script to your machine.

2. **Run the Setup Script**:

   - On **Windows**, double-click the `git-cmg-setup-windows.bat` file to run it in Git Bash.
   - On **Linux**, open a terminal and run the following command:
     ```bash
     bash git-cmg-setup-linux.sh
     ```
   - On **macOS**, open a terminal and run the following command:
     ```bash
     bash git-cmg-setup-macos.sh
     ```

   This will:

   - Create a `~/scripts` directory if it doesn't exist.
   - Copy `git-cmg.sh` to the `~/scripts` directory.
   - Set the `git-cmg` alias in your Git configuration.
   - Grant execute permissions to `git-cmg.sh`.

3. **Verify Alias**:
   After running the script, you can verify that the alias was successfully set by running:
   ```bash
   git config --global --get alias.cmg
   ```
   You should see the alias pointing to the `git-cmg.sh` script.

## Usage

Once the setup is complete, you can use the new `git-cmg` alias by running the following command:

```bash
git cmg
```

This will execute the `git-cmg.sh` script.

### Troubleshooting

- **Permission Denied Error (Linux/macOS/Windows)**:
  If you encounter a "Permission denied" error, ensure that the `git-cmg.sh` script has execute permissions. Run:
  ```bash
  chmod +x ~/scripts/git-cmg.sh
  ```
- **Git Configuration Issues**:
  If the alias isn't working, verify your Git configuration using:
  ```bash
  git config --global --get alias.cmg
  ```

## Customization

The `commit-msg-generator.sh` script is highly customizable. Tailor it to your project's specific commit message conventions. Adjust rules and constraints, such as:

- Defining consistent prefixes for different types of commits (e.g., "⭐ feature:", "🛠️ fix:", "🔃 refactor:")
- Enforcing minimum and maximum message lengths
- Specifying patterns or regular expressions for commit message matching
- Customizing error messages for validation failures

Warning: if you change commit message structure you need to fix validation in `commit-msg` file too.

## Contributing

We encourage contributions to this project. If you'd like to make improvements, fork the repository, make your changes, and create a pull request. We welcome any suggestions for enhancing this commit message generator and validator.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/realattila/clean_git_commit_message/blob/main/LICENSE.md) file for details.
