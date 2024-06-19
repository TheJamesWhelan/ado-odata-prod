// Deploy Azure Data Explorer databases

param clusterName string = 'azcxppmo-udp-adex'
param location string = resourceGroup().location
param env string
param dbnames array = [
  'PLT_CXPFEEDBACK'
  'PLT_ENTITYTRACKER'
  'PLT_HEALTHMONITORING'
  'PLT_PMOSHARED'
  'PLT_TIMECUBE'
  'PLT_UDP'
  'PRG_ACP'
  'PRG_CXPMANAGED'
  'PRG_PMO'
  'PRG_PULSESENTIMENT'
  'PRG_RESILIENCY'
]

resource adx_database 'Microsoft.Kusto/clusters/databases@2023-08-15' = [
  for dbname in dbnames: {
    kind: 'ReadWrite'
    name: '${clusterName}-${env}/${dbname}'
    location: location
    properties: {
      softDeletePeriod: 'P365D'
      hotCachePeriod: 'P31D'
    }
  }
]


// Azure Data Factory MI
param tenId string = '33e01921-4d64-4f8c-a055-5bdaffd5e33d'
param prinId string = 'aa3d8c6b-9b9c-4a58-ad07-23bc192eecb3'

resource adx_databasepmerissions 'Microsoft.Kusto/clusters/databases/principalAssignments@2023-08-15' = [
  for dbname in dbnames: {
    name: dbname
    properties: {
      principalId: prinId
      principalType: 'App'
      tenantId: tenId
      role: ''
    }
  }
]

// Power BI Developer JIT SG
param tenId1 string = '72f988bf-86f1-41af-91ab-2d7cd011db47'
param prinId1 string = 'dc9c6ebd-7f8d-48b2-a7a3-8a59fa4ccf26'

resource adx_databasepmerissions1 'Microsoft.Kusto/clusters/databases/principalAssignments@2023-08-15' = [
  for dbname in dbnames: {
    name: dbname
    properties: {
      principalId: prinId1
      principalType: 'Group'
      tenantId: tenId1
      role: 'Viewer'
    }
  }
]

// Non-Person Account SG
param tenId2 string = '72f988bf-86f1-41af-91ab-2d7cd011db47'
param prinId2 string = '78923feb-b02d-45b2-a24c-b7fef1a39155'

resource adx_databasepmerissions2 'Microsoft.Kusto/clusters/databases/principalAssignments@2023-08-15' = [
  for dbname in dbnames: {
    name: dbname
    properties: {
      principalId: prinId2
      principalType: 'Group'
      tenantId: tenId2
      role: 'Viewer'
    }
  }
]
