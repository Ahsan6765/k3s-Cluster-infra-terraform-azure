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

curl -sfL https://get.k3s.io | K3S_URL=https://10.0.1.4:6443 K3S_TOKEN=K101858eddfdf94bbd697cf5182e8076c62fc16aa1d27cffacdcf65e613def05385::server:19b9900a2ef3023a4a5bc2eb9a7fdcb4 sh -


follow these steps for cluster setup.

==============================================================================================================================================================================================

Type:  kubernetes.io/service-account-token


eyJhbGciOiJSUzI1NiIsImtpZCI6InlWWmlmOF85QXlCaVJUNHgwN05YeEp3T2Vzdk9aWEl2LXZNbTVuWlJuRDgifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyLXRva2VuIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiJlZTI3YzQyNi1hMDk0LTQzMjEtOWZlMi0wN2FiMzVlYTUyZTUiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZXJuZXRlcy1kYXNoYm9hcmQ6YWRtaW4tdXNlciJ9.eVdy-wb8eOh2D9HmzZqqK_6xhdb4MDXCQbVbtT8s4KUuB3FnkuHWHHi2my0RZ2Zky1t529ocLjMaJgnmdZFx9poO8j4zQS91RCdCx4Ype035MfBOTeH9iCrlQy4Qg4I_gOU01a2XEmmrTP9fiLJopSzrpQCDOx9Ec3guT0kFRSQAmBnHky52D-l7cHZPC26rivQ8TD10SH9N9yZ309gND6Gd-_zwcl6dLsfHrCbl2rVeyVfhBXjHslPJpMEiB-7UFAE5f_IxMTiHi4iOkoCaOGfuFDWw2ubghY06ZWnpwqZun8NSeQQiao0_mFVcO5ISikpTY9jZ9YkhSWbLRa62dg







-L 8001:localhost:8001
ssh -i /home/ahsan-malik/Desktop/k3s-Cluster-infra/ssh/id_rsa -L 8001:localhost:8001 azureuser@52.191.62.164
ssh -i "/home/ahsan-malik/Desktop/k3s-Cluster-infra/ssh/id_rsa" azureuser@172.172.186.199
