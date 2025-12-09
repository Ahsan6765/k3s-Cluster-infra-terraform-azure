follow these
Step 1:
Install K2s Cluster Script given belwo:
curl -sfL https://get.k3s.io | sh - 
# Check for Ready node, takes ~30 seconds 
sudo k3s kubectl get node 

OR

curl -sfL https://get.k3s.io | sh - 
# Check for Ready node, takes ~30 seconds 
sudo k3s kubectl get node 


===================================================
Step 2: Get the K3s Token from the Master Node
sudo cat /var/lib/rancher/k3s/server/node-token
Copy this token — you'll need it on the worker nodes.

===================================================
Step 3: Get the Master Node's IP Address
hostname -I
Or use:
ip a | grep inet

===================================================
Step 4: Install K3s Agent on Worker Nodes
curl -sfL https://get.k3s.io | K3S_URL=https://<master-INTERNAL-IP>:6443 K3S_TOKEN=<master-token-here> sh -

===================================================
Step 5: Verify Node Join
sudo k3s kubectl get nodes


Step 4: Install K3s Agent on Worker Nodes Template here --- update this with master internal ip and master token and use it on the workers.

curl -sfL https://get.k3s.io | K3S_URL=https://10.0.1.4:6443 K3S_TOKEN=K1038cb817adbfa728e7a621e56ddd878bff21d04777b4683c403ed68c58dde9de1::server:123764022ae3f318e3c68d18e81088b9 sh -


follow these steps for cluster setup.

==============================================================================================================================================================================================

Type:  kubernetes.io/service-account-token


eyJhbGciOiJSUzI1NiIsImtpZCI6InplOF9mTFJFNGhsdDQ5UG5wV0lpaVh5Q2JmTkctR1VDVmplR2l1N3ptalkifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI3NmExYzk3YS1kZGViLTQwZjItODcyMy1hZTdkZTYzYzY0MTQiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZXJuZXRlcy1kYXNoYm9hcmQ6YWRtaW4tdXNlciJ9.lZhasOg6iTvgvsRAuKETOVqg83ZIfEBLS0BmFct8ufM4QCQe6wG4XBc189HPnjPnx7SPKMMLxm8XsHR95675jrKE2cwkqF4CyktxQI4K4hQd05vxcCIbAU8QGUn0WsIQ4Do5nQMwToTBFAmHve6hFdwNCj8SKQxtl-xictzY-ui_ZzTapqubzSNVVDzBbmitB7fA5AmNjlv3JifVgatA3yB1liPsrzP99yk10VbJbZf77WZtn8lfHEVgY4cGT9NkCh6S1VyMQAfa90TewxK9tX4eCor-UZYiT0A_O0U5WIfx2z0gf8iakX9S1bhTXjME09KeM3BjlGdE2JldWobKXg






-L 8001:localhost:8001
ssh -i /home/ahsan-malik/Desktop/k3s-Cluster-infra/ssh/id_rsa -L 8001:localhost:8001 azureuser@172.173.173.68
ssh -i "/home/ahsan-malik/Desktop/k3s-Cluster-infra/ssh/id_rsa" azureuser@172.190.58.11
