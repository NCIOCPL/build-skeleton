# This is the template for a release build.
# Command Line Parameters:
#   $1 - GitHub token for creating a release and uploading artifacts.

echo Creating Release Build.

# Create temporary location for publishing output
TMPDIR=`mktemp -d` || exit 1

# Export token and enterprise api to enable github-release tool
export GITHUB_TOKEN=$1
# export GITHUB_API=https://git.{your domain}.com/api/v3 # needed only for enterprise

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
