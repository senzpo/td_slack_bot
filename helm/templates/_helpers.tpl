{{/*
Common labels
*/}}

{{- define "common.labels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
chart: {{ $.Chart.Name }}-{{ $.Chart.Version }}
{{- end -}}