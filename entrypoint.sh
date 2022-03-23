SERVICE_ARN=$1
STATUS=$( aws apprunner describe-service --service-arn $SERVICE_ARN | jq -r ".Service.Status")
DESIRED_STATUS="RUNNING"
echo $1

while true 
do
 if [ $STATUS != $DESIRED_STATUS ]
 then
    sleep 10
    STATUS=$( aws apprunner describe-service --service-arn $SERVICE_ARN | jq -r ".Service.Status")
 else
  echo true
  break
 fi
done
