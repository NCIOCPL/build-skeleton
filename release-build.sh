# This is the template for a release build.
# Command Line Parameters:
#   $1 - GitHub userid for creating a release and uploading artifacts.
#   $2 - GitHub token for creating a release and uploading artifacts.

echo Creating Release Build.

# Create temporary location for publishing output
TMPDIR=`mktemp -d` || exit 1

# Export token and enterprise api to enable github-release tool
export GITHUB_USER=$1
export GITHUB_TOKEN=$2

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
github-release delete --user ${GITHUB_USER} --repo ${GITHUB_REPO} --tag ${VERSION_NAME}

echo "Creating a new release in github"
github-release release --user ${GITHUB_USER} --repo ${GITHUB_REPO} --tag ${VERSION_NAME} --name "${VERSION_NAME}"

echo "Uploading the artifacts into github"
github-release upload --user ${GITHUB_USER} --repo ${GITHUB_REPO} --tag ${VERSION_NAME} --name "${PROJECT_NAME}-${VERSION_NAME}.zip" --file artifacts.zip
