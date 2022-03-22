SERVICE_ARN=$1
STATUS=$( aws apprunner describe-service --service-arn $1 | jq -r ".Service.Status")
DESIRED_STATUS="RUNNING"
COUNTER=10
ZERO=0
while [ $COUNTER -ge $ZERO ]
do
  echo "not true status is " $STATUS
  COUNTER=$(($COUNTER - 1))
done
