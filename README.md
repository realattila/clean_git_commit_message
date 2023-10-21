# Git Commit Message Generator and Validator

Improve your Git commit history with this handy Bash script and Git commit message hook. This tool helps you generate consistent commit messages and ensures they follow your desired format. Maintain a cleaner and more organized project history for better collaboration.

## Table of Contents

1. [**Requirements**](#Requirements)
2. [**Installation**](#installation)
3. [**Usage**](#usage)
4. [**Customization**](#customization)
5. [**Contributing**](#contributing)

## Requirements

This project designed for "Git" you need "Git" installed in your machine.

**For Windows Users Only (Linux and Mac skip this section):**
If you're using Windows and want to use this script, you'll need to run it in a Bash environment. Follow these steps:

1.  **Open Git Bash:**

    - If you're in a Git project directory, you can right-click and choose "Open Git Bash here."
    - Alternatively, you can search for "Git Bash" in the Start Menu.

2.  **Navigate to Your Project Directory:**

    - Once you have Git Bash open, make sure you are in git project repository. If you are not you can use the `cd` command to move to your Git project repository. For example, if your project is located at `C:\Users\attila\Projects\your-repo`, you can navigate to it with the following command:

    bashCopy code
    `cd /c/Users/attila/Projects/your-repo`
    Replace the path with the actual path to your Git project directory.

## Installation

Get started by setting up the commit message generator and validator:

1.  **Clone this repository:**
    `git clone https://github.com/realattila/clean_git_commit_message`
2.  **Move to repository**
    `cd clean_git_commit_message`
3.  **Copy the scripts to your project's hooks directory:**
    `cp commit-msg your-repo/.git/hooks/ `
    `cp commit-msg-generator.sh your-repo/`
    **Or you can do it with simple copy paste.**
    Copy `commit-msg` in `.git/hook` directory
    Copy `commit-msg-generator.sh` in project directory (`./`)

4.  **Make the `commit-msg` script executable:(Only Linux users)**
    `chmod +x your-repo/.git/hooks/commit-msg`

## Usage

Make sure your Terminal location is in your git project repository (you can make sure with run `pwd` command).
With the commit message generator and validator in place, creating and validating commit messages is a breeze:

1. **Commit with a generated message:**
   `bash commit-msg-generator.sh`
   This command executes the `commit-msg-generator.sh` script and uses its output as your commit message.
2. **Automatic validation:**
   The `commit-msg` hook will trigger automatically during commits. It validates your commit message format based on the rules you've set in the `commit-msg-generator.sh` script. Incorrect messages will be rejected.

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
