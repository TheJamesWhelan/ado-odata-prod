# Unified Data Platform JIT Policies
This document outlines the JIT policies for access to the Unified Data Platform in AME

- [Unified Data Platform JIT Policies](#unified-data-platform-jit-policies)
  - [Subscription Policy](#subscription-policy)
    - [Visual Representation of Subscription policy](#visual-representation-of-subscription-policy)
    - [Team Security Group](#team-security-group)
    - [Approvers Security Group](#approvers-security-group)
  - [Team Security Group Access](#team-security-group-access)


## Subscription Policy
There is a single policy which covers subscription access in both Production and Pre-Production environments.

### Visual Representation of Subscription policy

### Team Security Group
You must be a member of one or both of the following security groups to get access to the subscription.

| Security Group      | Environment    |
| ------------------- | -------------- |
| tm-azcxppmo-udp-prd | Production     |
| tm-azcxppmo-udp-ppe | Pre-Production |


### Approvers Security Group
Each policy has an approvers group.  Only approvers in that group can approve/reject the access request.

| Security Group      | Environment    | Notes                                           |
| ------------------- | -------------- | ----------------------------------------------- |
| ap-azcxppmo-udp-prd | Production     |                                                 |
| ap-azcxppmo-udp-ppe | Pre-Production | Not Yet In Use During Security Remediation Work |


## Team Security Group Access
Access to the team security group is by request only, with a valid business justification.  This needs to be submitted in Azure Dev Ops and assigned to the PMO Data Platform Team for review.
