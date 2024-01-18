#!/bin/bash

#############################
# Author: Lahiru
# Date: 28th-Dec
#
# Version: v1
# 
# This script will report the AWS resource usage
############################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# Enable debugging
set -x


# list s3 buckets and direct output to the resourceTracker file
echo "List S3 buckets"
aws s3 ls > resourceTracker

# list EC2 Instances and direct output to the resourceTracker file
echo "List EC2 Instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list Lambda functions and direct output to the resourceTracker file
echo "List Lambda functions"
aws lambda list-functions >> resourceTracker

# list IAM users and direct output to the resourceTracker file
echo "List IAM users"
aws iam list-users >> resourceTracker
