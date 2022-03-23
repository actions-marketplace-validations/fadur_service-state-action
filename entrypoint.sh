SERVICE_ARN=$1
STATUS=$( aws apprunner describe-service --service-arn $SERVICE_ARN | jq -r ".Service.Status")
DESIRED_STATUS="RUNNING"
echo $STATUS
while true 
do
 if [ "$STATUS" != $DESIRED_STATUS ] 
 then
    sleep 10
    STATUS=$( aws apprunner describe-service --service-arn $SERVICE_ARN | jq -r ".Service.Status")
    echo "status is " "$STATUS"
 else
    echo "status is " "$STATUS"
    break
 fi
done
