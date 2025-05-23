# debug-pod
Debug pod to troubleshoot in kubernetes environments 


## Non-root

``` YAML

apiVersion: v1
kind: Pod
metadata:
  name: debug-pod
  namespace: default
  labels:
    app: debug
spec:
  securityContext:
    runAsUser: 1000
    runAsGroup: 3000
    runAsNonRoot: true
  containers:
    - name: debug
      image: ghcr.io/matopst/debug-pod:latest
      command: ["sleep", "infinity"]
      securityContext:
        allowPrivilegeEscalation: false
      resources:
        requests:
          memory: "50Mi"
          cpu: "20m"
  restartPolicy: Never

```

## Root
``` YAML
apiVersion: v1
kind: Pod
metadata:
  name: debug-pod
  namespace: default
  labels:
    app: debug
spec:
  securityContext:
    runAsUser: 0
  containers:
    - name: debug
      image: ghcr.io/matopst/debug-pod:latest
      command: ["sleep", "infinity"]
      securityContext:
        allowPrivilegeEscalation: true
      resources:
        requests:
          memory: "50Mi"
          cpu: "20m"
  restartPolicy: Never


```