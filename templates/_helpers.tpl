{{/*
Expand the name of the chart.
*/}}
{{- define "dedicate-node-labeling.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "dedicate-node-labeling.fullname" -}}

{{- $name := default .Chart.Name }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "dedicate-node-labeling.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "dedicate-node-labeling.labels" -}}
helm.sh/chart: {{ include "dedicate-node-labeling.chart" . }}
{{ include "dedicate-node-labeling.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "dedicate-node-labeling.selectorLabels" -}}
app.kubernetes.io/name: {{ include "dedicate-node-labeling.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

