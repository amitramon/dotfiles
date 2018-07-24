# if kubectl found, source its bash completion output
if [ -x /usr/bin/kubectl -o -x /usr/local/bin/kubectl ]; then
    . <(kubectl completion bash)
fi

