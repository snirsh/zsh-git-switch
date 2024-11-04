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
    # Get the branch name associated with the PR
    branch_name=$(gh pr view "$pr_number" --json headRefName -q .headRefName)

    if [ -n "$branch_name" ]; then
        # Checkout the branch
        git checkout "$branch_name"
        echo "Switched to branch $branch_name"
    else
        echo "Could not find branch for PR #$pr_number"
        return 1
    fi
}
