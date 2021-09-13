var vnet1 = { 
  name: 'vnet1'  
  addressspace: '10.1.0.0/16'
  subnet1: '10.1.1.0/24' 
}

var vnet2 = {  
  name: 'vnet2'  
  addressspace: '10.0.0.0/16'
  subnet1: '10.0.1.0/24' 
}

resource virtualnetwork1 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnet1.name
  location: resourceGroup().location
  properties:{
    addressSpace:{
      addressPrefixes: [
        vnet1.addressspace
      ]
    }    
    subnets: [      
      {
        name: 'subnet1'
        properties:{
          addressPrefix: vnet1.subnet1
        }
      }     
    ]  
  }
}

resource virtualnetwork2 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnet2.name
  location: resourceGroup().location
  properties:{
    addressSpace:{
      addressPrefixes: [
        vnet2.addressspace
      ]
    }    
    subnets: [      
      {
        name: 'subnet1'
        properties:{
          addressPrefix: vnet2.subnet1
        }
      }     
    ]  
  }
}

resource VnetPeering1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  parent: virtualnetwork1
  name: '${vnet1.name}-${vnet2.name}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualnetwork2.id
    }
  }
}

resource VnetPeering2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  parent: virtualnetwork2
  name: '${vnet2.name}-${vnet1.name}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: virtualnetwork1.id
    }
  }
}



