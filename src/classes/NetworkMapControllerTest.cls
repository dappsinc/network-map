// Dapps Incorporated 2020. All Rights Reserved.

@isTest
public class NetworkMapControllerTest {
    
    @testSetup
    static  void init() {
        
        dsoa__NodeSettings__c orgWiseProperty = new dsoa__NodeSettings__c();
        orgWiseProperty.Name = 'Properties';
        orgWiseProperty.dsoa__username__c = '1210982091809820980980980';
        orgWiseProperty.dsoa__nodeAddressURL__c = 'callout:DSOA_Network';
        orgWiseProperty.dsoa__Organization_Id__c = UserInfo.getOrganizationId();
        orgWiseProperty.dsoa__Private_Key__c = 'abcdefghijklmnopqrstuvwxyz123456';
        orgWiseProperty.dsoa__compatabilityZoneURL__c = 'https://dsoa.network:8080';
        orgWiseProperty.dsoa__webserverURL__c = 'https://dsoa.network:';
        orgWiseProperty.dsoa__webserverPort__c = '10050';
        orgWiseProperty.dsoa__Port__c = '10002';
        orgWiseProperty.dsoa__p2pAddress__c = 'localhost' + orgWiseProperty.dsoa__Port__c;
        orgWiseProperty.dsoa__truststorePassword__c = 'truststore';
        insert orgWiseProperty;
        
        }
    	static testMethod void testAll() {
        run();
       
    	}
        
        @future(callout=true)
    	static void run(){
            
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator('[{}]'));
        NetworkMapController.getNodes();
        NetworkMapController.getNotaries('{"data":""}');
        NetworkMapController.deleteNodes('{"data":""}');
        NetworkMapController.certmanGenerate('{"data":""}');
        NetworkMapController.doormanCertification('{"data":""}');
        NetworkMapController.publishNetworkMap('{"data":""}');
        NetworkMapController.networkMap('{"data":""}');
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator('{"statusCode":200,"status":"SUCCESS","responseStr":{"keyObj" : {"address":"ADD123"}}}'));
        

    }
    
    

}