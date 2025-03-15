#!/bin/bash

PODS=$(kubectl get pods -l app=nginx -o=jsonpath='{.items[*].metadata.name}')
COUNT=1

for POD in $PODS
do
  echo "Updating index.html for pod: $COUNT"
  echo "My Custom Nginx Page. This page is served by Pod: ${COUNT}"
  kubectl exec -it $POD -- /bin/bash -c "echo '<h1>My Custom Nginx Page</h1><p>This page is served by Pod: ${COUNT}</p>' > /usr/share/nginx/html/index.html"
  

  COUNT=$((COUNT+1))
done

echo "All pods updated successfully."
