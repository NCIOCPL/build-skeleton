# This is the template for a release build.

echo Creating Release Build.

# Create temporary location for publishing output
TMPDIR=`mktemp -d` || exit 1

# Publish to temporary location.
dotnet restore
dotnet publish -o $TMPDIR

# Create archive for uploading to GitHub
echo "Creating release archive"
zip -r project-release.zip $TMPDIR

