# network-map
Corda Network Map - Salesforce Lightning Interface

Network Map Visualforce Page for surfacing nodes in a Corda Network within the Salesforce Lightning interface.

### Setup Instructions

1) Create the Visualforce Page and a Tab within the Salesforce Platform
2) Update the API Key for Google Maps
3) Set the Endpoint in the Controller of where your Network Map Server is running
4) Add Nodes to the Network

This will work with the open-source Cordite Network Map Docker Container:

```bash

docker run -p 8080:8080 -e NMS_STORAGE_TYPE=file cordite/network-map

```
