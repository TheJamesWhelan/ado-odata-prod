# Managed Identities for Third-Party Connections
This document provides a detailed guide on the process for third-party integrations with the Azure CXP PMO Unified Data Platform (UDP).


- [Managed Identities for Third-Party Connections](#managed-identities-for-third-party-connections)
  - [Overview](#overview)
    - [User assigned Managed Identity](#user-assigned-managed-identity)
    - [Private endpoint](#private-endpoint)
  - [Pre-requistes](#pre-requistes)
  - [Endpoint](#endpoint)
  - [PMO Team Short Codes](#pmo-team-short-codes)
  - [Versioning](#versioning)


## Overview
As part of the Azure CXP Security remediation efforts, access to the PMO Unified Data Platform will be restricted exclusively to managed identities hosted by AME. For an understanding of the necessary prerequisites and steps for onboarding, please refer to this document.


### User assigned Managed Identity
You will need to create a user assigned managed identity, which we will grant the viewer security role to, for the specified table(s) within our Azure Data Explorer (Kusto) [endpoint](#endpoint). This user assigned managed identity **must** be provisioned within the AME environment and adhere to the following naming convention:


```
SYNTAX (lower case):
<yourteamname>_mi_pmoudp_<pmoteamshortcode>_<env>

EXAMPLE:
contosoinsights_mi_pmoudp_pul_prd
```
For a full list of PMO team short codes, refer [here](#pmo-team-short-codes)

**NOTE:** Each program and environment you wish to connect to will need it's own user assigned managed identity.

### Private endpoint


## Pre-requistes

1. An AME-hosted [user-assigned user assigned managed identity](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp)
2. A private endpoint to access the endpoint



## Endpoint

## PMO Team Short Codes

## Versioning

| Version | Date | Author | Changes Made | Comments |
| ------- | ---- | ------ | ------------ | -------- |
| v1.0.0  | 5/18/2024 | James Whelan | Initial draft | Initial version of the document |