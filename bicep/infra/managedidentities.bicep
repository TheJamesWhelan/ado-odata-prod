// Managed Identities

param env string
param sacnames array = ['cds'
                        'asql'
                        'adex'
                        'ado'
                        'ablb'
]

var managedIdentityName = 'mi_azcxppmo_udp'

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = [
  for sac in sacnames : {
    name: '${managedIdentityName}_${sac}_${env}'
    location: 'West US'
  }]
