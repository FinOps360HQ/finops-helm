{{/*
Get FinOps 360 url from remote write target with "finops360" name.
*/}}
{{- define "kube-cost-metrics-collector.finops360Url" -}}
{{- range $value := .Values.prometheus.server.remote_write }}
{{- if eq $value.name "finops360" }}
{{- printf "%s" $value.url | trimSuffix "storage/api/v2/write" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Define the prometheus.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "finops360-k8s-collector.prometheus.namespace" -}}
{{- if .Values.prometheus.forceNamespace -}}
{{ printf "namespace: %s" .Values.prometheus.forceNamespace }}
{{- else -}}
{{ printf "namespace: %s" .Release.Namespace }}
{{- end -}}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "finops360-k8s-collector.prometheus.name" -}}
{{- default .Chart.Name .Values.prometheus.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "finops360-k8s-collector.prometheus.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create unified labels for prometheus components
*/}}
{{- define "finops360-k8s-collector.prometheus.common.matchLabels" -}}
app: {{ template "finops360-k8s-collector.prometheus.name" . }}
release: {{ .Release.Name }}
{{- end -}}

{{- define "finops360-k8s-collector.prometheus.common.metaLabels" -}}
chart: {{ template "finops360-k8s-collector.prometheus.chart" . }}
heritage: {{ .Release.Service }}
{{- end -}}

{{- define "finops360-k8s-collector.prometheus.server.labels" -}}
{{ include "finops360-k8s-collector.prometheus.server.matchLabels" . }}
{{ include "finops360-k8s-collector.prometheus.common.metaLabels" . }}
{{- end -}}

{{- define "finops360-k8s-collector.prometheus.server.matchLabels" -}}
component: {{ .Values.prometheus.server.name | quote }}
{{ include "finops360-k8s-collector.prometheus.common.matchLabels" . }}
{{- end -}}
