#!/bin/bash

sed s/$/"\\\n"/ CHANGELOG.txt|tr -d '\n' > release-notes.txt

description=`cat release-notes.txt`

curl --request POST "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/repository/tags/$CI_COMMIT_TAG/release" \
--header "PRIVATE-TOKEN: ${Access_Token}" \
--header "Content-Type: application/json" \
-d "
{
   \"description\": \"${description}\"
}
"