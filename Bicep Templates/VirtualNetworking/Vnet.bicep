param addressPrefix string
param subnet string


resource vnetWestUs2 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: 'vnetEast'
  location: resourceGroup().location
  properties:{
    addressSpace:{
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'subnet1'
        properties:{
          addressPrefix: subnet
        }
      }
    ]
  }
}
