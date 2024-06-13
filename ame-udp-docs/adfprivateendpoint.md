## Azure Data Factory Private Endpoint Access Configuration
This document outlines the steps needed to configure Azure Data Factory (ADF) to communicate with a resource using a private endpoint only

- [Azure Data Factory Private Endpoint Access Configuration](#azure-data-factory-private-endpoint-access-configuration)
- [Sequence of Actions](#sequence-of-actions)
  - [Step 1: Integration runtime setup](#step-1-integration-runtime-setup)
  - [Step 2: Managed private endpoints](#step-2-managed-private-endpoints)
  - [Step 3: Approve private endpoint in resource](#step-3-approve-private-endpoint-in-resource)
  - [Step 4: Credentials](#step-4-credentials)
  - [Step 5: Linked services](#step-5-linked-services)
  - [Step 6: Publish](#step-6-publish)
- [Managed Identity Resource Permissioning](#managed-identity-resource-permissioning)
  - [Azure SQL Commands to Permission Database](#azure-sql-commands-to-permission-database)
  - [Azure Data Explorer Commands to Permission Database](#azure-data-explorer-commands-to-permission-database)

## Sequence of Actions

### Step 1: Integration runtime setup
You will need to create a new integrated runtime to allow access using managed private endpoint

Integration runtimes | New

Azure, Self-Hosted > Azure

Provide name and description

Virtual network > Enable

Create

### Step 2: Managed private endpoints
Create a new managed private endpoint.  Select what type of resource you are wanting to connect to

Following the naming convention guidance for Managed private endpoints in ADF

Wait until Provisioning state has completed


### Step 3: Approve private endpoint in resource
Go to the resource you wish to connect ADF to

Go to Security | Networking (name may vary between resources) and review Private access.  There should be a pending approval to the Managed private endpoint created in [Step 1](#step-1-managed-private-endpoints)

Return to ADF and wait until Approval state is showing as Approved.  Once approved continue to [Step 3](#step-3-credentials)



### Step 4: Credentials
Next you will want to create a credential

NOTE:  If you have not created a managed identity, then follow the steps here

NOTE:  The managed identity you wish to use needs to have the requisite permissions on the resource you wish to access.  Refer here for more information

Following the naming guidance for creating a credential in ADF

Select User Assigned Managed Identity

Select Subscription

Select the managed identity you wish to use

Publish

### Step 5: Linked services
Ensure the managed identity you wish to use has the appropriate permissions

Select service you wish to connect to

Provide name aligned to naming convention

Change *Connect via integration runtime* to the runtime you created in Step 3

- Azure Subscription
- Server Name
- Database Name

For Authentication type choose "Use Assigned Managed Identity"

Select the credential you created in Step 4

Test connection (if Connection successful is not seen, then troubleshooting accordingly)

Create

### Step 6: Publish
Once finished click Publish all


## Managed Identity Resource Permissioning

| Resource | Permission Level | Minimum Permission(s) Needed | Comments |
| -------- | ---------------- | ---------------------------- | -------- |
| Azure SQL | Database | db_reader & db_writer | This will not allow for table auto creation in ADF |
| Azure Data Explorer | Database | ingestors & viewers | - |

### Azure SQL Commands to Permission Database
```sql
create user [<managed identity name>] from external provider
alter role db_datareader add member [<managed identity name>]
alter role db_datawriter add member [<managed identity name>]
```

### Azure Data Explorer Commands to Permission Database

```kql
.add database PulseLegacy ingestors ('aadapp=<managed identity object id>')
.add database PulseLegacy viewers  ('aadapp=<managed identity object id>')
```