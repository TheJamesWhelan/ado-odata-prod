//Create Azure SQL Databases

param serverName string
param location string = 'East US'
param dbnames array = [
  'PLT_CXPFEEDBACK'
  'PLT_ENTITYTRACKER'
  'PLT_HEALTHMONITORING'
  'PLT_PMOSHARED'
  'PLT_TIMECUBE'
  'PLT_UDP'
  'PRG_ACP'
  'PRG_ACX'
  'PRG_CXPMANAGED'
  'PRG_PMO'
  'PRG_PULSESENTIMENT'
  'PRG_RESILIENCY'
]

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: serverName
  location: location
}

resource sqlDB 'Microsoft.Sql/servers/databases@2022-05-01-preview' = [
  for dbname in dbnames: {
    parent: sqlServer
    name: '${dbname}_test'
    location: location
    sku: {
      name: 'GP_S_Gen5'
      tier: 'GeneralPurpose'
      family: 'Gen5'
      capacity: 1
    }
  }
]

resource sqlPerms 'Microsoft.Sql/servers/databases/advisors@2023-08-01-preview'
