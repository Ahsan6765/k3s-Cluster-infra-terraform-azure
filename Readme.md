follow these

Step 1: Get the K3s Token from the Master Node
sudo cat /var/lib/rancher/k3s/server/node-token
Copy this token — you'll need it on the worker nodes.

Step 2: Get the Master Node's IP Address
hostname -I
Or use:
ip a | grep inet

Step 3: Install K3s Agent on Worker Nodes
curl -sfL https://get.k3s.io | K3S_URL=<master-INTERNAL-IP>:6443 K3S_TOKEN=<master-token-here> sh -

Step 4: Verify Node Join
sudo k3s kubectl get nodes