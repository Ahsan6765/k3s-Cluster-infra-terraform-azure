🖥️ Deploy Kubernetes Dashboard on K3s

1. Apply the Dashboard Manifest
Run this on your master node:
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

==============================================================
==============================================================

2. Create an Admin User
Create a file admin-user.yaml:

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

==============================================================
==============================================================

Create a Secret for the ServiceAccount

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


==============================================================
==============================================================

Get the Token

kubectl -n kubernetes-dashboard describe secret admin-user-token


==============================================================
==============================================================

3. Get the Login Token
Run:
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')


==============================================================
==============================================================

4. Access the Dashboard
Start a proxy:
kubectl proxy
Open in your browser (from the master VM or via SSH tunnel):
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
Login using the token from step 3.


==============================================================
==============================================================
