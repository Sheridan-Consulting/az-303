targetScope='subscription'
param resourceGroupName string = 'AZ303-VPCPeering'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: 'westus'
}

module eastvnet 'Vnet.bicep' = {
  name: 'eastvnet'
  scope: resourceGroup(resourceGroupName) 
  dependsOn: [
    rg
  ]
}
