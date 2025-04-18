# Add __init__.py to specified directory and all its sub directories lol

# Print usage/help
print_usage() {
  echo "Usage: $0 <directory_path>"
  echo ""
  echo "Recursively adds an __init__.py file to every subdirectory of the given path."
  echo "Works with relative (e.g., .) and absolute paths."
  echo ""
  echo "Options:"
  echo "  -h, --help    Show this help message and exit"
}

# Handle help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  print_usage
  exit 0
fi

# Check if directory argument is provided
if [ -z "$1" ]; then
  echo "Error: No directory path provided."
  print_usage
  exit 1
fi

# Resolve to absolute path
TARGET_DIR=$(realpath "$1")

# Check if the path is a valid directory
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: '$TARGET_DIR' is not a valid directory."
  exit 1
fi

# Traverse all subdirectories and add __init__.py
find "$TARGET_DIR" -type d | while read -r dir; do
  INIT_FILE="$dir/__init__.py"
  if [ ! -f "$INIT_FILE" ]; then
    touch "$INIT_FILE"
    echo "Created: $INIT_FILE"
  fi
done

echo "All done."

