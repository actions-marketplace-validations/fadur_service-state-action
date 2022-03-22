SERVICE_ARN=$1
STATUS=$( aws apprunner describe-service --service-arn $1 | jq -r ".Service.Status")
DESIRED_STATUS="RUNNING"
while true 
do
 if [ $STATUS != $DESIRED_STATUS ]
 then
    sleep 10
    STATUS=$( aws apprunner describe-service --service-arn $1 | jq -r ".Service.Status")
 else
  echo true
  break
 fi
done
