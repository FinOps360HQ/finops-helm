FinOps 360 Kubernetes Cost Metrics Collector
====

Ready-to-deploy setup of components necessary for Kubernetes cost management and FinOps in FinOps 360.

Components

- [Prometheus](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus)
  - [kube-state-metrics](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-state-metrics)
  - [prometheus-node-exporter](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-node-exporter)
  - [prometheus-pushgateway](https://github.com/walker-tom/helm-charts/tree/main/charts/prometheus-pushgateway)
- [kube-service-selectors](https://github.com/FinOps360HQ/finops-helm/tree/main/charts/kube-service-selectors)

## Prerequisites

Prerequisites are based on dependencies:

- Kubernetes 1.17+
- Helm 3+

## Description

Helm chart for the FinOps 360 Kubernetes Collector project, which is created to collect Kubernetes resources information and share it with FinOps 360 project - <https://finops360.ru>

## Installation

One release per cluster

```bash
helm install kube-cost-metrics-collector finops360/kube-cost-metrics-collector \
--set prometheus.server.dataSourceId=<data-source-id> \
--set prometheus.server.username=<username> \
--set prometheus.server.password=<password> \
--namespace finops360 \
--create-namespace
```

## Upgrade

```bash
helm upgrade kube-cost-metrics-collector finops360/kube-cost-metrics-collector \
--namespace finops360
```

## Configuration

The following table lists the commonly used configurable parameters of the Helm chart.

Parameter | Description
--------- | ------------------------------------------------
prometheus.server.dataSourceId | FinOps 360 Kubernetes data source id
prometheus.server.username | username which is used on FinOps 360 Kubernetes data source registration
prometheus.server.password | password which is used on FinOps 360 Kubernetes data source registration
prometheus.kubeStateMetrics.enabled | set to false if external kube-state-metrics exists and accessible
prometheus.prometheus-node-exporter.enabled | set to false if external node-exporter exists and accessible
prometheus.prometheus-pushgateway.enabled | set to false if external pushgateway exists and accessible

Additional options are in [values.yaml](values.yaml). Alternatively run

```bash
helm show values finops360/kube-cost-metrics-collector
```
