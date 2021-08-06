This is my capstone project.
It is a blue/green deployment

The EKS cluster was created with:
eksctl create cluster -f eks-cluster.yml

kubectl get pods -o wide
NAME                      READY   STATUS    RESTARTS   AGE   IP               NODE                                              NOMINATED NODE   READINESS GATES
website-66d6df9f4-dv5rh   1/1     Running   0          9h    192.168.14.252   ip-192-168-17-59.eu-central-1.compute.internal    <none>           <none>
website-66d6df9f4-mk56v   1/1     Running   0          9h    192.168.62.252   ip-192-168-52-133.eu-central-1.compute.internal   <none>           <none>
website-66d6df9f4-x7qfh   1/1     Running   0          9h    192.168.73.117   ip-192-168-69-72.eu-central-1.compute.internal    <none>           <none>

kubectl get service -o wide
NAME         TYPE           CLUSTER-IP      EXTERNAL-IP                                                                 PORT(S)        AGE   SELECTOR
kubernetes   ClusterIP      10.100.0.1      <none>                                                                      443/TCP        11h   <none>
website      LoadBalancer   10.100.20.143   a0a8d40c3c76f46c6b51ecedf64565ec-814622456.eu-central-1.elb.amazonaws.com   80:31360/TCP   9h    app=capstone,tier=website