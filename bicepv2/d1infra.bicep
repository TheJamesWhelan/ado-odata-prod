// This file is for infrastructure deployment

// Sequence
//
// 1. Resource Group
// 2. Virtual Network including Bastion - ON HOLD
// 3. Azure Key Vault
// 4. Azure Data Factory
// 5. Azure Data Explorer
// 6. Azure SQL

// Parameters
// All resources should use location of West US unless not available, in which case order of preference is West US 2 and then West US 3

param location string = 'West US'
param nameprepend string = 'azcxppmo-udp-'
@description('Enter either PPE for pre-production or PRD for production')
@allowed(['ppe', 'prd'])
param environment string
param dbnames array = [
  'PLT_CXPFEEDBACK'
  'PLT_ENTITYTRACKER'
  'PLT_HEALTHMONITORING'
  'PLT_SHAREDRESOURCES'
  'PLT_TIMECUBE'
  'PLT_OKR'
  'PRG_ACX'
  'PRG_CXPMANAGED'
  'PRG_PULSE'
  'PRG_PULSESENTIMENT'
  'PRG_RESILIENCY'
]
@description('Enter your AME alias **ONLY**')
param alias string

// Virtual Network

// Azure Key Vault

// Azure Data Factory

// Azure Data Explorer

// Azure SQL
resource newAsql 'Microsoft.Sql/servers@2023-08-01-preview' = {
  location: location
  name: '${nameprepend}asql-${environment}'
  tags: {
    Environment: environment
    Creator: alias
  }
  properties: {
    administrators: {
      administratorType: 'ActiveDirectory'
      azureADOnlyAuthentication: true
      login: '${alias}@ame.gbl'
      principalType: 'User'
      sid: '695cbea5-b6c1-4224-9cde-3193afc270d4'
      tenantId: '33e01921-4d64-4f8c-a055-5bdaffd5e33d'
    }
    publicNetworkAccess: 'Enabled'
  }
}

resource sqlDB 'Microsoft.Sql/servers/databases@2022-05-01-preview' = [
  for dbname in dbnames: {
    parent: newAsql
    name: '${dbname}'
    location: location
    sku: {
      name: 'GP_S_Gen5'
      tier: 'GeneralPurpose'
      family: 'Gen5'
      capacity: 1
    }
  }
]
