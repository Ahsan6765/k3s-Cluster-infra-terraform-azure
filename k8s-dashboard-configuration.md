                                ======================== Deploy Kubernetes Dashboard on K3s ========================


1. Apply the Dashboard Manifest

Run this on your master node:
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

========================

2. Create a Secret for the ServiceAccount

Make a file admin-user-token.yaml

apiVersion: v1
kind: Secret
metadata:
  name: admin-user-token
  namespace: kubernetes-dashboard
  annotations:
    kubernetes.io/service-account.name: "admin-user"
type: kubernetes.io/service-account-token

Apply it:
kubectl apply -f admin-user-token.yaml
========================


2. Create an Admin User

filename admin-user.yaml, file given below

apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard


Apply it:
kubectl apply -f admin-user.yaml
========================

3. Get the Login Token

kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

Copy the long token string — this is your login credential.


========================
4. Login to Dashboard

Start proxy:
kubectl proxy

Open:
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

Paste the token.
========================================================================

This is the quickest way to access the dashboard from outside. 

Option 1: Expose via NodePort 


1. Edit the Dashboard Service

By default, the dashboard service is ClusterIP  (internal only). Change it to NodePort: 

kubectl -n kubernetes-dashboard edit service kubernetes-dashboard

Find:
spec:
  type: ClusterIP

Change to:
spec:
  type: NodePort

Save and exit.


OR:

Patch Command

Run this on your master:

kubectl patch svc kubernetes-dashboard -n kubernetes-dashboard \
  -p '{"spec": {"type": "NodePort", "ports": [{"port":443,"targetPort":8443,"protocol":"TCP","nodePort":32000}]}}'


• 	This changes the Service type from ClusterIP → NodePort .
• 	It binds the Dashboard to port 32000 on every node.

🔍 Verify:

kubectl get svc -n kubernetes-dashboard

You should see somethings like this given below:

NAME                   TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)         AGE
kubernetes-dashboard   NodePort   10.43.103.26   <none>        443:32000/TCP   ...

🌐 Access:

https://<nodeIP>:32000
========================================================================

2. Get the NodePort

https://<nodeIP>:32000
Example:
https://52.170.61.170:32000


========================================================================

Lab: Create a clean Deployment manifest for Nginx and apply it to your cluster 

File: nginx-deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 2   # number of pods
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

Steps to Apply

- 	Save this file

nano nginx-deployment.yaml

- Apply it:

kubectl apply -f nginx-deployment.yaml

- Verify:

kubectl get deployments
kubectl get pods -l app=nginx


========================================================================

Lab : Expose the Deployment

1. want to access Nginx externally, create a Service:

File: nginx-service.yaml

Apply it:
kubectl apply -f nginx-service.yaml

Then check:
kubectl get svc nginx-service

You’ll see a NodePort (e.g., 30080). Access via:
http://<nodeIP>:<nodePort>




    terraform force-unlock a08d3d19-f53e-7815-530c-72e57758c920
ssh -i /home/ahsan-malik/Desktop/k3s-Cluster-infra/ssh/id_rsa azureuser@20.185.80.86



-L 8001:localhost:8001
ssh -i /home/ahsan-malik/Desktop/k3s-Cluster-infra/ssh/id_rsa -L 8001:localhost:8001 azureuser@172.173.173.68
ssh -i "/home/ahsan-malik/Desktop/k3s-Cluster-infra/ssh/id_rsa" azureuser@172.190.58.11
