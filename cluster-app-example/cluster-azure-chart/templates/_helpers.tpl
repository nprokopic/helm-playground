{{/*
Expand the name of the chart.
*/}}
{{- define "cluster-azure-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cluster-azure-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cluster-azure-chart.labels" -}}
helm.sh/chart: {{ include "cluster-azure-chart.chart" . }}
{{ include "cluster-azure-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cluster-azure-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cluster-azure-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
