follow these

Install K2s Cluster Script given belwo:
curl -sfL https://get.k3s.io | sh - 
# Check for Ready node, takes ~30 seconds 
sudo k3s kubectl get node 

===================================================
Step 1: Get the K3s Token from the Master Node
sudo cat /var/lib/rancher/k3s/server/node-token
Copy this token — you'll need it on the worker nodes.

===================================================
Step 2: Get the Master Node's IP Address
hostname -I
Or use:
ip a | grep inet

===================================================
Step 3: Install K3s Agent on Worker Nodes
curl -sfL https://get.k3s.io | K3S_URL=https://<master-INTERNAL-IP>:6443 K3S_TOKEN=<master-token-here> sh -

===================================================
Step 4: Verify Node Join
sudo k3s kubectl get nodes


10.0.1.5

curl -sfL https://get.k3s.io | K3S_URL=https://10.0.1.5:6443 K3S_TOKEN=K108b7e0a238e080d6b82b4edcabf929b918a93372cfb1ce8c5c0b99661933b0f82::server:b150a59cecff502614f2ef6f9aa4d6ff sh -


follow these steps for cluster setup.