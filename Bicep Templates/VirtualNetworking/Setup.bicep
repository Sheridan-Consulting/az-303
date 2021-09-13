targetScope='subscription'

param EastresourceGroupName string ='EastRg'
param EastLocation string ='eastus'
param EastAddressSpace string ='10.1.0.0/16'
param EastSubnet1 string ='10.1.1.0/24'
param EastGatewaySubnet string = '10.1.0.0/24'

param WestresourceGroupName string ='WestRg'
param WestLocation string ='westus'
param WestAddressSpace string ='10.0.0.0/16'
param WestSubnet1 string ='10.0.1.0/24'
param WestGatewaySubnet string = '10.0.0.0/24'

resource EastRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: EastresourceGroupName
  location: EastLocation
}

module eastvnet 'Vnet.bicep' = {
  name: 'eastvnet'
  scope: resourceGroup(EastresourceGroupName)
  params:{
    addressPrefix: EastAddressSpace
    subnet: EastSubnet1
    gwSubnet: EastGatewaySubnet
  }
  dependsOn: [
    EastRG
  ]
}


resource WestRg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: WestresourceGroupName
  location: WestLocation
}

module westbnet 'Vnet.bicep' = {
  name: 'westvnet'
  scope: resourceGroup(WestresourceGroupName)
  params:{
    addressPrefix: WestAddressSpace
    subnet: WestSubnet1
    gwSubnet: WestGatewaySubnet
  }
  dependsOn: [
    WestRg
  ]
}
