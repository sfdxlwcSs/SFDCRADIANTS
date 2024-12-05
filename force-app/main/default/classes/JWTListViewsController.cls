public class JWTListViewsController {
    
    public void getDesOrgListViewDetails(JWT jwt){
        
        String assertion=jwt.assertion();
        System.debug('🚀'+assertion);
         String grantType = 'urn:ietf:params:oauth:grant-type:jwt-bearer';
        String access_token = null;
        String body = 'grant_type='+EncodingUtil.urlEncode(grantType, 'UTF-8')+'&assertion=' + jwt.assertion();
        HttpRequest req = new HttpRequest();                            
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        req.setHeader('Content-type', 'application/x-www-form-urlencoded');
        req.setBody(body);
        Http http = new Http();               
      
            HTTPResponse res = http.send(req);
            if ( res.getStatusCode() == 200 ) {
                Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
                access_token = (String)responseMap.get('access_token');
                System.debug('org Url'+(String)responseMap.get('instance_url'));
                fetchAccountDetails(access_token);
                 System.debug('🚀✔'+access_token);
            }else{
                System.debug('JWTBearerFlow Error Occurred '+res.getBody());
            }
       
       
        
    }
    
    public static void fetchAccountDetails(String accessToken) {
       
        String accountId = '0015j00001UrtSjAAJ';
        
        HttpResponse response = AccountInfoFetcher.getAccountInfo(accessToken, accountId);
       
    }

}