# vLLM on kubernetes

This repo deploys a vLLM OpenAI Inference Server on kubernetes.

## Deploy vLLM

To deploy the vLLM OpenAI Inference Server run the following command:

```bash
make deploy-vllm
```

Inspect deployment and wait for it to become ready:

```bash
make get-deploy
```

Verify also that the pod is ready:

```bash
make get-pods
```

Obtain the service endpoint:

```bash
make get-svc
```

## Query endpoint

See below examples of how to query the service endpoint:

```bash
# Query the completions endpoint
curl <k8s_service_ip>:80/v1/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "facebook/opt-125m",
        "prompt": "San Francisco is a",
        "max_tokens": 7,
        "temperature": 0
    }'

# Query the chat template endpoint
curl <k8s_service_ip>:80/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
        "model": "facebook/opt-125m",
        "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "Who won the world series in 2020?"}
        ]
    }'
```

## Delete deployment

To delete the deployment simply run:

```bash
make delete-vllm
```
