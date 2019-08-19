// Dapps Incorporated 2019. All Rights Reserved.

public with sharing class NetworkMapController {
    
    class NodeWrapper{
        @AuraEnabled
        public String nodeKey{get;set;}
        @AuraEnabled
        public String key{get;set;}
        @AuraEnabled
        public List<Map<String,String>> addresses{get;set;}
        @AuraEnabled
        public List<Map<String,String>> parties{get;set;}
    }
    
    @RemoteAction
    public static List<NodeWrapper> getNodes(){
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('callout:DSOA_Network_Map_API' + '/admin/api/nodes');
        request.setMethod('GET');
        HttpResponse response = httpProtocol.send(request);
        return (List<NodeWrapper>)JSON.deserialize(response.getBody(), List<NodeWrapper>.class);
    }
    
    
    @RemoteAction
    public static String getNotaries(String reqMapStr){
        // system.debug('***inside onclickapex call***reqMapStr:'+reqMapStr);        
        return HttpUtils.submitRequestWithMethod(reqMapStr, 'getNotaries');
    }
    
    
    @RemoteAction
    public static String deleteNodes(String reqMapStr){
        // system.debug('***inside onclickapex call***reqMapStr:'+reqMapStr);        
        return HttpUtils.submitRequestWithMethod(reqMapStr, 'deleteNodes');
    }
    
    
    
    @RemoteAction
    public static String certmanGenerate(String reqMapStr){
        return HttpUtils.submitRequestWithMethod(reqMapStr, '/certman/api/generate');
    }
    
    
    @RemoteAction
    public static String doormanCertification(String reqMapStr){
        return HttpUtils.submitRequestWithMethod(reqMapStr, '/certificate');
    }

    
        @RemoteAction
    public static String publishNetworkMap(String reqMapStr){
        return HttpUtils.submitRequestWithMethod(reqMapStr, '/network-map/publish');
    }

    
        @RemoteAction
    public static String networkMap(String reqMapStr){
        return HttpUtils.submitRequestWithMethod(reqMapStr, '/networkMap');
    }
    

}