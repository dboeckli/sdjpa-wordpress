{{/*
Expand the name of the chart.
*/}}
{{- define "sdjpa-wordpress-mysql.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sdjpa-wordpress-mysql.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sdjpa-wordpress-mysql.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sdjpa-wordpress-mysql.labels" -}}
helm.sh/chart: {{ include "sdjpa-wordpress-mysql.chart" . }}
{{ include "sdjpa-wordpress-mysql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sdjpa-wordpress-mysql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sdjpa-wordpress-mysql.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the FQDN for the service
*/}}
{{- define "sdjpa-wordpress-mysql.serviceFQDN" -}}
{{- $fullname := include "sdjpa-wordpress-mysql.fullname" . -}}
{{- printf "%s.%s.svc.cluster.local" $fullname .Release.Namespace }}
{{- end }}
