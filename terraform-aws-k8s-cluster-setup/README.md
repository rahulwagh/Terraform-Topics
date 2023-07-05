## 1. Install terraform - [Installation Guide terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
## 2. Create a directory `k8s-infra`
## 3. Git Clone the k8s cluster setup repo from terraform
```bash
git clone https://github.com/hashicorp/learn-terraform-provision-eks-cluster
```
## 4. Install `AWS CLI`
```bash
sudo apt install awscli
```

## 5. Retrieve the access credentials for your cluster and configure `kubectl`
```bash
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

>Added new context arn:aws:eks:eu-central-1:242396018804:cluster/education-eks-NxyRj49h to /home/ubuntu/.kube/config

## 6. Install the kubectl 
1. Install kubectl binary with curl on Linux 
```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl```
```

2. Install kubectl
```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

3. Verify the kubectl 
```bash
kubectl version --client
```

4. Get the cluster info
```bash
kubectl cluster-info
```

## 7. Install helm chart

```bash
curl -L https://git.io/get_helm.sh | bash -s -- --version v3.8.2
```

```bash
chmod 700 get_helm.sh 
```

```bash
./get_helm.sh 
```