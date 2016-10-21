# This is the template for a release build.

echo Creating Release Build.

# Create temporary location for publishing output
TMPDIR=`mktemp -d` || exit 1

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

# Export token and enterprise api to enable github-release tool
export GITHUB_TOKEN=$$$$$$$$$$$$
export GITHUB_API=https://git.{your domain}.com/api/v3 # needed only for enterprise
