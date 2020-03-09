export AWS_PROFILE=linux
aws cloudformation delete-stack \
  --stack-name $1