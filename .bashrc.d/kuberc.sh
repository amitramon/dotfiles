# if kubectl found, enablet bash completion for it
if [ -x /usr/bin/kubectl -o -x /usr/local/bin/kubectl ]; then
    . <(kubectl completion bash)
fi
