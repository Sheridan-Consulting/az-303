# Virtual Networking Tasks
- Setup 3 VNets with private addresses and subnets
- Setup Virutal Gateway 
- Setup Peering between these networks
- Setup Linux VM to verify connectivy
- Setup IP Connection

## Commands

### Deploy Bicep Templates
    az deployment sub create --location eastus --template-file Setup.bicep

### Cleanup
    az group delete --name WestRG
    az group delete --name EastRG