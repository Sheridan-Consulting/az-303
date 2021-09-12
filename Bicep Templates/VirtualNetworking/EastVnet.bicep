resource vnetWestUs2 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: 'vnetEast'
  location: resourceGroup().location
  properties:{
    addressSpace:{
      addressPrefixes: [
        '10.2.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'subnet1'
        properties:{
          addressPrefix: '10.2.1.0/24'
        }
      }
    ]
  }
}
