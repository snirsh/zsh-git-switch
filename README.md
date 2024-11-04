# Git Utils Zsh Plugin

This Oh My Zsh plugin provides utilities for Git and Yarn, including:
- A function to switch Git branches by Pull Request (PR) number.

## Features

- **Switch Branch by PR Number**: Quickly switch to the branch associated with a specific PR number, using `gswp <PR_NUMBER>`.

- **Create a PR based on the latest commit message**: This will automatically create a PR using the latest commit message for the branch name and PR title `create-pr` (you can also pass params for `gh pr create` which it uses behind the scenes thanks to [@ChenK14](https://github.com/ChenK14) for the motivation and idea)

## Requirements

- **GitHub CLI (`gh`)**: This plugin requires the GitHub CLI to switch branches by PR number. If you haven't installed it yet, you can find instructions [here](https://cli.github.com/).

## Installation

1. **Clone the Repository**:
   Clone this repository into your Oh My Zsh custom plugins directory:

   ```bash
   git clone https://github.com/snirsh/zsh-git-utils.git ~/.oh-my-zsh/custom/plugins/git-utils
   ```
2. **Add this to your `~/.zshrc`**
   ```bash
   plugins=(... git-utils)
   ```
4. **Reload ZSH**
   ```bash
   source ~/.zshrc
   ```
