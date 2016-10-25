# This is the template for a release build.
# Command Line Parameters:
#   $1 - GitHub token for creating a release and uploading artifacts.

# Required Enviroment Variables
# GH_ORGANIZATION_NAME - The GitHub organization (or username) the repository belongs to. 
# GITHUB_REPO - The repository where the build should be created.
# VERSION_NUMBER - Semantic version number.
# PROJECT_NAME - Project name

echo Creating Release Build.

# Create temporary location for publishing output
TMPDIR=`mktemp -d` || exit 1

# Make GitHub security token available to release tool. 
export GITHUB_TOKEN=$1

# Main project directory
PROJECT_DIR=`pwd`

# Publish to temporary location.
dotnet restore
dotnet publish -o $TMPDIR

# Create archive for uploading to GitHub.  Creating it in the
# Publishing folder eliminates the parent directory path.
echo "Creating release archive"
cd $TMPDIR
zip -r project-release.zip .
cd $PROJECT_DIR

echo "Deleting release from github before creating new one"
github-release delete --user ${GH_ORGANIZATION_NAME} --repo ${GITHUB_REPO} --tag ${VERSION_NUMBER}

echo "Creating a new release in github"
github-release release --user ${GH_ORGANIZATION_NAME} --repo ${GITHUB_REPO} --tag ${VERSION_NUMBER} --name "${VERSION_NUMBER}"

echo "Uploading the artifacts into github"
github-release upload --user ${GH_ORGANIZATION_NAME} --repo ${GITHUB_REPO} --tag ${VERSION_NUMBER} --name "${PROJECT_NAME}-${VERSION_NUMBER}.zip" --file $TMPDIR/project-release.zip
