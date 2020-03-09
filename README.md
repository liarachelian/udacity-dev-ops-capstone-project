# Udacity Dev Ops Capstone Project
This is the working repository for my Udacity DevOps Capstone Project 

## Description

This is a SilverStripe CMS that has been uploaded created using CLoudFormation and then rolled out to a kubernetes
 microservices cluster.

##Install

1. First you will need to install the Jenkins Host and then add Blue Ocean plugin

###Installation of Jenkins Host
1. Create EC2 pem key called "jenkins-host"
2. Create "JenkinsCICDRole" Role with EC2, VPC, S3, CF and IAM full access in AWS

The UserData on the Jenkins host will automatically install the Jenkins Server and a Cloud Formation Linting tool
