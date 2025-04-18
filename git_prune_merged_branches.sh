# Delete local branches merged into main, except the ones marked and PROTECTED below.

# CONFIGURATION
MAIN_BRANCH="main"
PROTECTED=("main" "dev" "release" "MASTER" "master")

# switch to main and fetch
git checkout "$MAIN_BRANCH" && git fetch --prune

# list merged branches, filter out protected
merged=$(git branch --merged "$MAIN_BRANCH" | sed 's/^[ *]*//' )
for branch in $merged; do
  if [[ ! " ${PROTECTED[@]} " =~ " ${branch} " ]]; then
    git branch -d "$branch" && echo "Deleted: $branch"
  fi
done

