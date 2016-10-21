# This is the template for a release build.

echo Creating Release Build.

# Create temporary location for publishing output
TMPFILE=`mktemp -d` || exit 1

# Build for publishing
dotnet restore
dotnet publish -o $TMPFILE
