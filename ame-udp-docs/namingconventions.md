# Unified Data Platform Naming Conventions
This document outlines the naming conventions used within the Azure CXP PMO Unified Data Platform (UDP)

- [Unified Data Platform Naming Conventions](#unified-data-platform-naming-conventions)
  - [General Recommendations](#general-recommendations)
  - [Azure Portal Recommendations](#azure-portal-recommendations)
    - [Subscription](#subscription)
      - [Subscription Environment](#subscription-environment)
        - [AME](#ame)
        - [CorpNet](#corpnet)
    - [Resource Groups](#resource-groups)
    - [Managed Identities](#managed-identities)
  - [Security Groups](#security-groups)
  - [Networking](#networking)
    - [Private Endpoints](#private-endpoints)
  - [Azure Data Factory Naming Conventions](#azure-data-factory-naming-conventions)
    - [Authoring](#authoring)
  - [References](#references)
    - [Program Short Codes (PSC)](#program-short-codes-psc)
    - [Repo Short Codes (RSC)](#repo-short-codes-rsc)
    - [Type Short Code (TSC)](#type-short-code-tsc)
    - [Service Abbreviation Codes (SAC)](#service-abbreviation-codes-sac)

## General Recommendations
The following recommendations and guidance have been adapted for the Unified Data Platform

[Abbreviation recommendations for Azure resources](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)

## Azure Portal Recommendations

### Subscription
All subscriptions related to the data platform, will begin with **azcxppmo_** or **AzCxPPMO_**

The purpose of the subscription should be included as the middle section, e.g. **unifieddataplatform** or **UnifiedDataPlatform**

#### Subscription Environment

##### AME

* For Production subscriptions, they should be appended with **_prd**
* For Pre-Production subscriptions, they should be appended with  **_ppe**

##### CorpNet
* For Production subscriptions, they should be appended with **_prd_pub**
* For Pre-Production subscriptions, they should be appended with  **_ppe_pub**

### Resource Groups
Resource groups should adopt the following naming convention

**rg_** followed by the purpose/use of the resource group

Appropriate resources are placed within the group

> EXAMPLE: rg_paas

### Managed Identities
Managed Identities should be created using the following naming convention

**azcxppmo_mi_udp_** followed by the [service abbreviation](#type-short-code-tsc) and then appended with **_prd** (for production subscriptions) or **_ppe** (for pre-production)

> EXAMPLE: azccxppmo_mi_udp_adex_ppe

NOTE: Program Short Code (PSC) are not included as parameters are used within Azure Data Factory

## Security Groups

| Prefix | Naming        | SAC             | Environment  | Usage |
| ------ | ------------- | ---------------------------- | ------------ | ----- |
| ap-    | azcxppmo-udp- | [Refer here](#service-abbreviation-codes-sac) | -prd or -ppe | Approvals group for JIT policy requests - any member can approve a JIT policy request  |
| tm-    | azcxppmo-udp- | [Refer here](#service-abbreviation-codes-sac)| -prd or -ppe | JIT policy - requestor MUST be a member of this group   |
| sec-   | azcxppmo-udp- | [Refer here](#service-abbreviation-codes-sac) | -prd or -ppe | Used to permission invidiual services for a service-specific JIT policy |

> EXAMPLE: ap-azcxppmo-udp-prd

**NOTE:**  Security groups are at a tenant level and can be seen by all subscriptions under the AME tenant.

## Networking

### Private Endpoints
Private endpoints will have the following naming convention

**pep-** followed by the abbreviation for the service:

| Service             | Abbreviation                                  |
| --------------------| --------------------------------------------- |
| Azure SQL           | [Refer here](#service-abbreviation-codes-sac) |
| Azure Data Explorer | [Refer here](#service-abbreviation-codes-sac) |
| Azure Data Factory  | [Refer here](#service-abbreviation-codes-sac) |
| Azure Blob Storage  | [Refer here](#service-abbreviation-codes-sac) |
| Dataverse           | [Refer here](#service-abbreviation-codes-sac) |

> EXAMPLE: pep-asql

## Azure Data Factory Naming Conventions
The following naming conventions will be used within Azure Data Factory

| Azure | Abbreviation | Linked Service | Dataset | PSC |
| ----- | ------------ | -------------- | -------- | -------------- |
| Azure Blob Storage | ablb_ | ls_ablb_ | ds_ablb_ | [Refer here](#program-short-codes-psc) |
| Azure Data Explorer | adex_ | ls_adex_ | ds_adex_ | [Refer here](#program-short-codes-psc) |
| Azure SQL database | asql_ | ls_asql_ | ds_asql_ | [Refer here](#program-short-codes-psc) |
| Dataverse | cds_ | ls_cds_ | ds_cds_ | [Refer here](#program-short-codes-psc) |

> EXAMPLE: ls_adex_pul


### Authoring

| Resource  | Abbreviation | PSC        | Description  | Execution     |
| --------- | ------------ | ---------- | ------------ | ------------- |
| Pipelines | pl_          | Refer here | _description | _trg  or _man |

> EXAMPLE: pl_pul_customers_trg

| Resource | Abbreviation | PSC | Description | RSC | TSC |
| -------- | ------------ | --- | ----------- | --- | ---- |
| Datasets | ds_ | Refer here | _description | [Refer here](#repo-short-codes-rsc) | [Refer here](#type-short-code-tsc) |

> EXAMPLE: ds_pul_customers_stg_src

## References

### Program Short Codes (PSC)
| Program  | Short Code (lowercase as appropriate)|
| -------- | ---------- |
| ACP | ACP |
| ACX | ACX |
| CXP Managed | MAN |
| CXP Feedback Hub | FBH |
| Insights | INS |
| PMO OKR | OKR |
| Platform Health | HEA |
| Resiliency | RES |
| Semantic Versioning | VER |
| Time Cube Reporting | TCR |
| PMO Shared | PMO |
| Pulse | PUL |

### Repo Short Codes (RSC)
| Repo Name            | Repo Type           | Usage    | Short Code |
| -------------------- | ------------------- | -----    | ---------- |
| azcxppmo-udp-asql-p* | Azure SQL           | ETL/ELT  | stg        |
| azcxppmo-udp-adex-p* | Azure Data Explorer | Endpoint | end        |


### Type Short Code (TSC)
| Resource | Short Code | Description |
| -------- | ---------- | ----------- |
| Source  | SRC | Source data |
| Destination | SNK | Destination where data is written (in ADF, this is called a sink)
| Query | QRY | When source data is obtained by running a query within the ADF pipeline 

### Service Abbreviation Codes (SAC)
| Service             | Abbreviation |
| ------------------- | ------------ |
| Azure SQL           | asql         |
| Azure Data Explorer | adex         |
| Azure Data Factory  | adf          |
| Azure Blob Storage  | ablb         |
| Dataverse           | cds          |