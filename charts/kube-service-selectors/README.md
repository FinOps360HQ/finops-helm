Helm chart for Kubernetes services selectors exporter
====
Exports Kubernetes services selectors as metrics.

[Source Code](https://github.com/FinOps360HQ/kube-service-selectors) | [Docker Image](https://hub.docker.com/r/FinOps360HQ/kube-service-selectors)

```bash
helm install kube-service-selectors FinOps360HQ/kube-service-selectors
```

#### Configuration
Available options are in [values.yaml](values.yaml). Alternatively run
```bash
helm show values FinOps360HQ/kube-service-selectors
```
