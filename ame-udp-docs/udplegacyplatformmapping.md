# Unified Data Platform Legacy Platform to AME Mapping
This document outlines the mapping between the legacy UDP platform (provisioned in Microsoft Corp tenant) and the UDP tenant in AME.  This document is for reference purpose only.

- [Unified Data Platform Legacy Platform to AME Mapping](#unified-data-platform-legacy-platform-to-ame-mapping)
  - [Resource Naming](#resource-naming)
  - [Security Groups](#security-groups)
    - [Security Groups for Resources](#security-groups-for-resources)
    - [Security Groups for JIT](#security-groups-for-jit)
  - [Email Groups](#email-groups)
    - [Email Groups for IcM](#email-groups-for-icm)

## Resource Naming

| Legacy Name                | Resource Type       | AME Name              | Subscription                     | Notes |
| -------------------------- | ------------------- | --------------------- | ---------------------------------| ----- |
| COSIMOPPE                  | Azure SQL Server    | azcxppmo-udp-asql-prd | azcxppmo_unifieddataplatform_ppe | -     |
| COSIMO                     | Azure SQL Server    | azcxppmo-udp-asql-ppe | azcxppmo_unifieddataplatform_prd | -     |
| EOFERWICPPE                | Azure Data Explorer | azcxppmo-udp-adex-ppe | azcxppmo_unifieddataplatform_ppe | -     |
| EOFERWIC                   | Azure Data Explorer | azcxppmo-udp-adex-prd | azcxppmo_unifieddataplatform_prd | -     |
| AzCxPPMOPPE                | Azure Data Factory  | azcxppmo-udp-adf-ppe  | azcxppmo_unifieddataplatform_ppe | -     |
| AzCxPPMO                   | Azure Data Factory  | azcxppmo-udp-adf-prd  | azcxppmo_unifieddataplatform_prd | -     |
| AzureCXPPMODataCatalog-PRD | Purview             | azcxppmo-udp-pur-prd  | azcxppmo_unifieddataplatform_prd | No Purview for PPE |
| azcxppmo                   | Azure Storage       | azcxppmoudpstoppe     | azcxppmo_unifieddataplatform_ppe | Unique across Azure and only lowercase and numbers |
| azcxppmoprod               | Azure Storage       | azcxppmoudpstoprd     | azcxppmo_unifieddataplatform_prd | Unique across Azure and only lowercase and numbers |
| AzureCxPPMOPPE             | Azure Key Vault     | -                     | -                                | Deprecated and using managed identities as preferred solution |
| AzureCxPPMO                | Azure Key Vault     | -                     | -                                | Deprecated and using managed identities as preferred solution |

## Security Groups
Security groups in AME are created and managed in [ATLAS](https://oneidentity.core.windows.net/Group).  You will need to log in on a SAW device and with your AME credentials for any security group work.

### Security Groups for Resources
The following groups have no equivalent in the legacy environment.

| Service | Security Group | Notes |
| ------- | -------------- | ----- |


### Security Groups for JIT

## Email Groups

### Email Groups for IcM