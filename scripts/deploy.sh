
#!/bin/bash
# Script de déploiement CloudFormation

echo "Déploiement du bucket S3..."
aws cloudformation deploy \
  --template-file templates/s3-bucket.yaml \
  --stack-name iac-s3-stack \
  --capabilities CAPABILITY_NAMED_IAM \
  --region us-east-1

echo "Déploiement de la table DynamoDB..."
aws cloudformation deploy \
  --template-file templates/dynamodb.yaml \
  --stack-name iac-dynamodb-stack \
  --capabilities CAPABILITY_NAMED_IAM \
  --region us-east-1

echo "Déploiement de la Lambda..."
aws cloudformation deploy \
  --template-file templates/lambda-upload.yaml \
  --stack-name iac-lambda-stack \
  --capabilities CAPABILITY_NAMED_IAM \
  --region us-east-1

echo "Déploiement terminé !"
