# Git Utils Zsh Plugin

This Oh My Zsh plugin provides utilities for Git and Yarn, including:
- A shorthand alias for `yarn` using `y`.
- A function to switch Git branches by Pull Request (PR) number.

## Features

- **Switch Branch by PR Number**: Quickly switch to the branch associated with a specific PR using `switch_branch_by_pr <PR_NUMBER>`.

## Requirements

- **GitHub CLI (`gh`)**: This plugin requires the GitHub CLI to switch branches by PR number. If you haven't installed it yet, you can find instructions [here](https://cli.github.com/).

## Installation

1. **Clone the Repository**:
   Clone this repository into your Oh My Zsh custom plugins directory:

   ```bash
   git clone https://github.com/your-username/git-utils-plugin.git ~/.oh-my-zsh/custom/plugins/git-utils
   ```
