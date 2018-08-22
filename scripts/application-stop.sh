#!/bin/bash
if [ "$DEPLOYMENT_GROUP_NAME" == "Prod" ]
then
	aws elb deregister-instances-from-load-balancer --load-balancer-name lb-mng-svcs-cd-prod-nlb-web-7e71b71fed8b3c9c.elb.us-west-2.amazonaws.com --instances $(curl http://169.254.169.254/latest/meta-data/instance-id) --region=us-west-2 
fi

sleep 30 

service nginx stop
service php-fpm stop

