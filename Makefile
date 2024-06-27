help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deploy: ## Deploy a vLLM k8s deployment and service
	@kubectl apply -f ./manifests/vllm-deployment.yaml

delete: ## Delete the vLLM k8s deployment and service from cluster
	@kubectl delete svc vllm-service -n vllm && \
	kubectl delete deploy vllm-deploy -n vllm

get-deploy: ## Get k8s vLLM deployment
	@kubectl get deploy -n vllm

get-svc: ## Get k8s vLLM service
	@kubectl get svc -n vllm

get-pods: ## Get k8s vLLM pods
	@kubectl get pods -n vllm
