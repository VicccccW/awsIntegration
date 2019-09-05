# Salesforce AWS Integration

## Referrence Link

[Connecting AWS and Salesforce Enables Enterprises to Do More with Customer Data](s3-us-west-2.amazonaws.com/awssfdcintegrationcode/PDF+version+of+CommentedSource_license.pdf)

[Sample Code](https://s3-us-west-2.amazonaws.com/awssfdcintegrationcode/PDF+version+of+CommentedSource_license.pdf)

[Bayeux Protocol, CometD, and Long Polling](https://developer.salesforce.com/docs/atlas.en-us.api_streaming.meta/api_streaming/BayeauxProtocolAndCometD.htm)

## Salesforce Repo

### For creating a new repo and link to Project

1. create a new project in VSC
2. git init
3. commit change to local repo
4. create a repo in github
5. push init commit to orignal repo

### For creating a connected app in scratch org

1. go to App Manager and create a New Connected App
2. enable OAuth and give permission
3. edit policy and relax IP restriction
4. pull change from scratch org
5. notice the Connected App consumerKey is per org

### For creating platform event

1. go to Platform Event
2. create new PE with custom fields

### For customizing SObject

1. go to object
2. create new fields for mapping to S3

### For trigger architect

1. trigger entry point
2. trigger handler
3. trigger helper
4. optionally a trigger custom metadata type for execution order control

## AWS Config

1 IAM Policy
2 Lambda Function
1 SNS
1 S3
