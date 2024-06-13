param factoryName string = 'AzureCxPPMO' // replace with your data factory name
var managedIdentityName = 'mi_azcxppmo_udp_cds_ppe'


// Create the credential in the data factory
resource dataFactoryCredential 'Microsoft.DataFactory/factories/credentials@2018-06-01' = {
  name: '${factoryName}/${managedIdentityName}'
  properties: {
    type: 'ManagedIdentity'
    typeProperties: {
      resourceId: managedIdentityName
    }
  }
}
