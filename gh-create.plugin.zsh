# git-utils.plugin.zsh

# pr-create function to create a branch, push it, and open a PR with the last commit message
pr-create() {
    # Ensure there are commits ahead of the remote branch
    current_branch=$(git symbolic-ref --short HEAD)
    if ! git log origin/"$current_branch"..HEAD --oneline | grep -q .; then
        echo "Error: No commits ahead of origin/$current_branch."
        return 1
    fi

    # Extract the last commit message
    last_commit_message=$(git log -1 --pretty=%B)

    # Format a branch name based on the last commit message
    # Replace spaces with hyphens and convert to lowercase
    branch_name=$(echo "$last_commit_message" | sed -e 's/ /-/g' | tr '[:upper:]' '[:lower:]')

    # Create and switch to the new branch
    git checkout -b "$branch_name"

    # Push the new branch to origin
    git push -u origin "$branch_name"

    # Create the PR using gh CLI with the last commit message as the title and body,
    # and pass any additional arguments to `gh pr create`
    gh pr create -t "$last_commit_message" -b "$last_commit_message" -H "$branch_name" "$@"

    echo "Pull request created successfully from branch '$branch_name' with title: $last_commit_message"
}
