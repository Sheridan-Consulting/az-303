# Virtual Networking Tasks
- Setup 3 VNets with private addresses and subnets
- Setup Virutal Gateway 
- Setup Peering between these networks
- Setup Linux VM to verify connectivity 
- Setup IP Connection

## Commands

### Deploy Bicep Templates
    az deployment sub create --location westus --template-file Setup.bicep

### Cleanup
    az group delete --name AZ303-VPCPeering
    