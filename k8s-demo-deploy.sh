set -e
NAME="k8s-demo-project-yt-api"
USERNAME="yashtulaskar"
IMAGE="$USERNAME/$NAME:latest"

echo "Building docker image...."

docker build -t $IMAGE .

echo "Pushing image to Docker Hub"

docker push $IMAGE

echo "Applying k8s manifests...."


kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml


echo "getting pods.."

kubectl get pods

echo "Getting services"

kubectl get services

echo "fetching the main service"

kubectl get services $NAME-service


