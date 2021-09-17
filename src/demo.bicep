param storageName string = 'bicepdemostosb'
param location string = 'northeurope'

var keyVaultName = 'bicepdemo-kv-sb'

resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: false
  }
}

resource vault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
  }
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  name: '${vault.name}/secret'
  properties: {
    value: listKeys(storage.id, storage.apiVersion).keys[0].value
  }
}

output storage string = storage.id
