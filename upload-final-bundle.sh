#!/usr/bin/env bash

BASE_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit 1 ; pwd -P )"
FHIR_BASE_URL=${FEASIBILITY_TESTDATA_UPLOAD_FHIR_BASE_URL:-http://localhost:8082/fhir}

FILES=("$BASE_DIR"/to_send/fhir-store-bundle*.json)
count=0
for fhirBundle in "${FILES[@]}"; do
  echo "Sending Testdata bundle $fhirBundle ..."
  curl -X POST -H "Content-Type: application/json" -d @"$fhirBundle" "$FHIR_BASE_URL"
  count=$((count + 1))
  echo $count
  if [[ "$count" -eq 100 ]]
  then
    count=0
    sleep 5
  fi
done
