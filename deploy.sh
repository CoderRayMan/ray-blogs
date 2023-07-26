#!/bin/bash

# Exit immediately if any command fails
set -e

# Check if the 'gh-pages' branch exists on the remote repository
if ! git show-ref --quiet refs/remotes/origin/gh-pages; then
  echo "The 'gh-pages' branch does not exist on the remote repository. Creating it..."
  git checkout --orphan gh-pages
  git rm -rf .
  git commit -m "Initial commit for gh-pages branch"
  git push origin gh-pages
fi
cd blogApp
# Build the Angular application for production
ng build --configuration=production --base-href="/ray-blogs/"
cd ..
# Switch to the 'gh-pages' branch
git checkout gh-pages

# Delete all files in the branch (except .gitignore) to prepare for the new build
git rm -rf .

# Move the built files from the 'dist' folder to the root of the repository
mv blogApp/dist/blog-app/** .

# Delete the now-empty 'dist' folder
rmdir blogApp

# Commit the changes
git add .
git commit -m "Deploy application"

# Push the 'gh-pages' branch to GitHub
git push origin gh-pages

# Switch back to the 'master' branch
git checkout main

echo "Deployment completed successfully!"
