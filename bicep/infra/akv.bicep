param keyVaultName string = 'azurecxppmoppe'
param secretName string = 'TestSecret'
@secure()
param secretValue string = 'password'

resource keyVault 'Microsoft.KeyVault/vaults@2021-11-01-preview' existing = {
  name: keyVaultName
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  name: '${keyVault.name}/${secretName}'
  properties: {
    value: secretValue
  }
}
