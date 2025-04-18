# Reclaim resources from unused Docker resources

if ! docker info >/dev/null 2>&1; then
  echo "Error: Docker daemon does not appear to be running." >&2
  exit 1 
fi

echo "Stopping and removing all stopped containers..."
docker container prune -f
echo "Done"

echo "Removing dangling images..."
docker image prune -f
echo "Done"

echo "Removing unused volumes..."
docker volume prune -f
echo "Done"

echo "Removing unused networks..."
docker network prune -f
echo "Done"
echo "Docker cleanup complete."

