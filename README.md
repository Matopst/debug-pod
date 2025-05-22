# debug-pod
Debug pod to troubleshoot in kubernetes environments 


## Non-root

``` YAML

apiVersion: v1
kind: Pod
metadata:
  name: debug-pod
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
  restartPolicy: Never

```

## Root
``` YAML
apiVersion: v1
kind: Pod
metadata:
  name: debug-root
  labels:
    app: debug
spec:
  containers:
    - name: debug
      image: ghcr.io/matopst/debug-pod:latest
      command: ["sleep", "infinity"]
  restartPolicy: Never
```