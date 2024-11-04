# Function to switch to a branch by PR number using GitHub CLI
gswp() {
    if ! command -v gh &> /dev/null; then
        echo "Error: GitHub CLI (gh) is not installed. Please install it to use switch_branch_by_pr."
        return 1
    fi

    if [ "$#" -ne 1 ]; then
        echo "Usage: switch_branch_by_pr <PR_NUMBER>"
        return 1
    fi

    pr_number=$1
    branch_name=$(gh pr view "$pr_number" --json headRefName -q .headRefName)

    if [ -n "$branch_name" ]; then
        git checkout "$branch_name"
        echo "Switched to branch $branch_name"
    else
        echo "Could not find branch for PR #$pr_number"
        return 1
    fi
}

# pr-create function to create a branch, push it, and open a PR with the last commit message
pr-create() {
    current_branch=$(git symbolic-ref --short HEAD)
    if ! git log origin/"$current_branch"..HEAD --oneline | grep -q .; then
        echo "Error: No commits ahead of origin/$current_branch."
        return 1
    fi

    last_commit_message=$(git log -1 --pretty=%B)
    branch_name=$(echo "$last_commit_message" | sed -e 's/ /-/g' | tr '[:upper:]' '[:lower:]')

    git checkout -b "$branch_name"
    git push -u origin "$branch_name"
    gh pr create -t "$last_commit_message" -b "$last_commit_message" -H "$branch_name" "$@"

    echo "Pull request created successfully from branch '$branch_name' with title: $last_commit_message"
}
