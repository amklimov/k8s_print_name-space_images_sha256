#!/usr/bin/env bash

NSPOD=$(kubectl get pod  --all-namespaces  | grep Running | awk '{print $1 "," $2}' | xargs -n1)

> ~/img_sha256.txt

for p in ${NSPOD[*]}; do
  NS=${p%,*}
  POD=${p#*,}
  NAME_SPACE=$(kubectl get pod $POD -n $NS -o json | jq '.metadata.namespace' | xargs -n1)
  IMAGE=$(kubectl get pod $POD -n $NS -o json | jq '.status.containerStatuses[0].image' | xargs -n1)
  SHA256=$(kubectl get pod $POD -n $NS -o json | jq '.status.containerStatuses[0].imageID' |  egrep -o 'sha256:.*')

  printf  "%-25s; %-80s; %80s\n"  $NAME_SPACE  $IMAGE  $SHA256 >> ~/img_sha256.txt

done

cat img_sha256.txt | uniq > img_sha256_uniq.txt
