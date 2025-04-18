# Serve current directory over a simple HTTP server

PORT=${1:-8000}

# for Python 3
if command -v python3 &>/dev/null; then
  echo "Serving at http://localhost:$PORT"
  python3 -m http.server "$PORT"
# fallback to Python 2
elif command -v python &>/dev/null; then
  echo "Serving at http://localhost:$PORT"
  python -m SimpleHTTPServer "$PORT"
else
  echo "Error: Python is not installed."
  exit 1
fi

