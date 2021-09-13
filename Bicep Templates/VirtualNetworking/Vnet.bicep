param addressPrefix string
param subnet string
param gwSubnet string



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
      {
          name: 'gwsubnet'
          id: 'gw'
          properties: {
            addressPrefix: gwSubnet
            applicationGatewayIpConfigurations:[
             {
               name: 'subetGw'
               properties: {
                 subnet: 
               }               
             }             
            ]
          }
      }
    ]
  
  }
}
