# Virtual Networking Tasks
- Setup 3 VNets with private addresses and subnets
- Setup Virutal Gateway 
- Setup Peering between these networks
- Setup Linux VM to verify connectivy
- Setup IP Connection

## Commands
### Create Resource Groups
    az group create --location westus --name  WestRG
    az group create --location eastus --name  EastRG

### Deploy Bicep Templates
    az deployment group create --template-file WestVnet.bicep --resource-group WestRG
    az deployment group create --template-file EastVnet.bicep --resource-group EastRG

### Cleanup
    az group delete --name WestRG
    az group delete --name EastRG