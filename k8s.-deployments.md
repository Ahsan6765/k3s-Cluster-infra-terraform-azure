📄 Nginx Pod Manifest

nginx-pod.yaml

apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80




kubectl apply -f nginx-service.yaml
Then access:
http://<vm-public-ip>:30080/

=========================================================

📄 Nginx Deployment Manifest

nginx-deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 2   # number of nginx pods you want
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80


🛠️ Apply the Deployment

kubectl apply -f nginx-deployment.yaml

kubectl apply -f nginx-deployment.yaml

🔍 Verify
kubectl get deployments
kubectl get pods -l app=nginx



=========================================================


Expose the Deployment
To access Nginx externally, create a Service:

nginx-service.yaml

apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30080   # choose a port between 30000–32767


kubectl apply -f nginx-service.yaml

Then access:

http://52.191.62.164:30080