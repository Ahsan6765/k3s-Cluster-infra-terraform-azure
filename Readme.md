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


10.0.1.5

curl -sfL https://get.k3s.io | K3S_URL=https://10.0.1.6:6443 K3S_TOKEN=K10eb89613137856c7cbd36bc7ed15a2af686af2ec284fff10264e741de2ed25405::server:eee1657f03b0f755dfdc6361eb5af61a sh -


follow these steps for cluster setup.