# if kubectl found, enablet bash completion for it
if [ -x /usr/bin/kubectl -o -x /usr/local/bin/kubectl ]; then
    . <(kubectl completion bash)
fi

# ditto minikube
if [ -x /usr/bin/minikube -o -x /usr/local/bin/minikube ]; then
    . <(minikube completion bash)
fi
