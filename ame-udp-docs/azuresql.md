# Azure SQL Deployment & Configuration for Azure CXP PMO in AME Environment
This document outlines the deployment and configuration steps for Azure SQL in the AME environment

- [Azure SQL Deployment \& Configuration for Azure CXP PMO in AME Environment](#azure-sql-deployment--configuration-for-azure-cxp-pmo-in-ame-environment)
  - [SQL Database Server Deployment](#sql-database-server-deployment)
    - [Create SQL Database Server](#create-sql-database-server)
    - [SQL Database Server Networking - Initial Settings for Config](#sql-database-server-networking---initial-settings-for-config)


## SQL Database Server Deployment
The Azure SQL Server deployment is undertaken in the Azure Portal.  To begin, you will only create a Database server.  Databases will be added at a later date using PowerShell.

### Create SQL Database Server

- Subscription
  - Resource Group
- Server name (this must be unique across all of Azure)
- Location (recommend you choose the location that your resource group is set to)
- Authentication
  - Use both SQL and Microsoft Entra authentication
    - Set Microsoft Entra admin - to begin with set as your alias@ame.gbl.  Once configured, this can and should be changed to a security group
    - Server admin login - Provide name for SQL login
    - Password - Prodive password for SQL login (you will need to enter this twice and it should confirm to password policy)
  - Networking  - leave "as is"
  - Security - leave "as is"
  - Additional settings - leave "as is"
  - Tags
    - Creator - alias@ame.gbl
    - Environment - either Pre-Production or Production
  - Review + create
    - Ensure validation has not failed and then press create

### SQL Database Server Networking - Initial Settings for Config
Once server has been deployed, you will need to make changes to the network settings.  This will allow you to make the initial settings, before additional restrictions are implemented.

- Public access
  - Choose selected networks
- Firewall rules
  - Add a rule to allow your SAW IP subnet to access SQL

**NOTE:** This setting will only be used during the initial configuration, database creation and managed identities permissioning.  Once this is completed, Public network access will be set to disabled and future access to the server will be made using Azure Bastion.
