#Create a Jenkins Job to Deploy an applicatio to Amazon Elastic Container Service
# Project README

## Step 1: Deploy Terraform Stack

Use Terraform in the `terraform` directory to deploy the stack, which includes:

- VPC with 2 public subnets, 2 private subnets, 1 internet gateway, and 1 NAT gateway.
- Public Security Group, Private Security Group.
- ECS Cluster
- Task Definition
- ECS Service
- Load Balancer
- Target Group

## Step 2: Check ECS Service via ALB

## Step 3: Create a Pipeline Job in Jenkins

Job name: `build-deploy-ecs`

Update `FULL_IMAGE` to your ECR URL.

In the pipeline job, use a Jenkinsfile to perform the following steps:

- Update the task definition with the image version latest
- Update the service with the new task definition.
- Force deploy the ECS Service.

## Step 4: Run the Job and Verify Results
Access ALB dns in your browser and  enjoy your result

## Step 5: Check ECS Service via ALB

**Important: Step 6: Delete Terraform Stack to Avoid Costs!**

Make sure to tear down the Terraform stack to avoid unnecessary costs.
