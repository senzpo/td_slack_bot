# K8s manifests for localhost usage

## Setup minikube

[Install minikube](https://minikube.sigs.k8s.io/docs/start/)

### Enable some addons

```
minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable registry
```

### Build image for minikube registry

```minikube image build . -t td_slack_bot```

#### or load from the host registry

```minikube image load <image name>```

## Create local setup

kubectl apply -k minikube
or separately

### Create namespace:

```kubectl apply -f minikube/namespace.yaml```

### Create deployment:

 ```kubectl apply -f minikube/app.yaml```

### Create app service:

```kubectl apply -f minikube/app-service.yaml```

access to service
minikube service td-slack-bot-service -n td-slack-bot

## Delete local setup

### Delete deployment:

```kubectl delete -f minikube/app.yaml```

### Delete namespace:
```kubectl delete -f minikube/namespace.yaml```

## Delete the whole cluster

```minikube delete --all```

