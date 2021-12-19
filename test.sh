#!/bin/bash
for server in $(cat hosts.txt); do 
	IP=`echo "$server" | awk 'BEGIN {RS = "|"}; END {print $1}'`;
	HOST=`echo "$server" | awk 'BEGIN {FS = "|"}; END {print $1}'`;
	USER=`echo $HOST | sed 's/tst-centos-//g;s/\-.//g;'`;
	echo "$HOST($IP)"
	echo $USER
	ssh -nt $USER@$IP -i ssh/$USER ' hostname >> /home/ec2-user/test.txt' 
done

k3s for demo with t2.micro ec2 = done. https://github.com/Mahisakapal/k3s-setup-on-t2.micro
promitious + grafana on k8s  = done. https://github.com/Mahisakapal/kubernetes-2/tree/master/monitoring
ELK on k8s & fluted on k8s  =done.  we need atlist 2 gb ram for elastic search on node :   https://github.com/Mahisakapal/kubernetes-2/tree/master/monitoring/kubernetes-elk


install eksctl first 
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version


eksctl create cluster \
--name myk8s \
--region ap-south-1 \
--nodes 2 \
--node-type t2.micro \
--with-oidc \
--ssh-access \
--ssh-public-key testnew \
--managed

once cluster ready go and install kubectl 

after this you can connetct eks cluster by using this url 

https://aws.amazon.com/premiumsupport/knowledge-center/eks-cluster-connection/

aws sts get-caller-identity
aws eks --region ap-south-1 update-kubeconfig --name myk8s




dynamic agents for jenkins on k8s	= https://faun.pub/jenkins-inside-kubernetes-bdee0340e0ca
datree for k8s manifaset check intiget in jenkins = https://faun.pub/jenkins-inside-kubernetes-bdee0340e0ca
karpentor for auto scalling = 
rabbit mq and kafka on k8s = https://www.youtube.com/watch?v=OqCK95AS-YE

https://www.youtube.com/watch?v=fZQXe84nPkw


groovy for jenkins 




curl -sfL https://get.k3s.io | K3S_NODE_NAME=$HOSTNAME K3S_URL=https://172.31.2.136:6443 K3S_TOKEN=K104674f312ef2ef0e6c84c8d6841159ef6149268e55ad11216c5aa54697d077de2::server:e7eae88ba10117ed190e8250a8601e4d sh -

