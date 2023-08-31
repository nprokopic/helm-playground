{{/*
Expand the name of the chart.
*/}}
{{- define "cluster-azure-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cluster-azure-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cluster-azure-app.labels" -}}
helm.sh/chart: {{ include "cluster-azure-app.chart" . }}
{{ include "cluster-azure-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cluster-azure-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cluster-azure-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
