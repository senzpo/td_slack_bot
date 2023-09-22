{{/*
Return the appropriate apiVersion for Deployment.
*/}}
{{- define "deployment.apiVersion" -}}
{{- print "apps/v1" -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for Service.
*/}}
{{- define "service.apiVersion" -}}
{{- print "v1" -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for PVC.
*/}}
{{- define "pvc.apiVersion" -}}
{{- print "v1" -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for HorizontalPodAutoscaler.
*/}}
{{- define "horizontalPodAutoscaler.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "autoscaling/v2/HorizontalPodAutoscaler" -}}
{{- print "autoscaling/v2" -}}
{{- else -}}
{{- print "autoscaling/v2beta2" -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for Ingress.
*/}}
{{- define "ingress.apiVersion" -}}
{{- print "networking.k8s.io/v1" -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for PodDisruptionBudget.
*/}}
{{- define "pdb.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "policy/v1/PodDisruptionBudget" -}}
{{- print "policy/v1" -}}
{{- else -}}
{{- print "policy/v1beta1" -}}
{{- end -}}
{{- end -}}