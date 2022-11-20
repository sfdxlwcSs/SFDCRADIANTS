/**
     * @description       : Success Factor API
     * @author            : Somnath Sharma
     * @group             : 
     * @last modified on  : 18-02-2022
     * @last modified by  : Somnath Sharma
    **/
    public class HRIS_SuccessFactorToDoEntryV2 {

    /**
    * @description Gen Assertion Step1 
    * @author Somnath Sharma | 15-02-2022 
    * @return // 
    **/
    //
    public static String getAssertion(){

    HttpRequest req = new HttpRequest();
    req.setHeader('Content-Type', HRIS_SuccessFactorEndPoints.CONTENTTYPE);
        String body='user_id='+EncodingUtil.urlEncode(HRIS_SuccessFactorEndPoints.user_id,'UTF-8')+
        '&token_url='+EncodingUtil.urlEncode(HRIS_SuccessFactorEndPoints.accessTokenUrl,'UTF-8')+
    '&client_id='+EncodingUtil.urlEncode(HRIS_SuccessFactorEndPoints.client_id,'UTF-8')+
    '&private_key='+EncodingUtil.urlEncode(HRIS_SuccessFactorEndPoints.PRIVATE_KEY_LWCORG,'UTF-8');
    req.setBody(body);
    req.setEndpoint(HRIS_SuccessFactorEndPoints.HRIS_SuccessFactorAssertionGenerationEndPoint);
    req.setMethod('POST');
    Http http = new Http();
    HttpResponse response = http.send(req);
    if(response.getStatusCode() != HRIS_SuccessFactorEndPoints.OK) {
        System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus()+'ERROR'+response.getBody());
    }
    else{
        System.debug('Assertion--> '+response.getBody());
            return String.valueOf(response.getBody());
        
    }
    return null;
    }

    /**
    * @description Generate Bearer Token Step2 From Step 1 Assertion 
    * @author Somnath Sharma | 15-02-2022 
    * @return // 
    **/
    //
    public static  String getBearerToken(){

    HttpRequest req = new HttpRequest();
    req.setHeader('Content-Type', HRIS_SuccessFactorEndPoints.CONTENTTYPE);
    String body='grant_type='+EncodingUtil.urlEncode(HRIS_SuccessFactorEndPoints.grant_type,'UTF-8')+
    '&client_id='+EncodingUtil.urlEncode(HRIS_SuccessFactorEndPoints.client_id,'UTF-8')+
    '&assertion='+EncodingUtil.urlEncode(getAssertion(),'UTF-8')
    +'&company_id='+EncodingUtil.urlEncode('DOVERDEV','UTF-8');
    req.setBody(body);
    req.setEndpoint(HRIS_SuccessFactorEndPoints.HRIS_SuccessFactorTokenGenerationEndPoint);
    req.setMethod('POST');
    Http http = new Http();
    HttpResponse response = http.send(req);
    // Parse the JSON response
    if(response.getStatusCode() != HRIS_SuccessFactorEndPoints.OK) {
        //get the list of header names (keys)
                String[] headerkeys = response.getHeaderKeys();
                //create an object to store your header key-value pairs
                Map<string, string> headers = new map<string, string>();
                //iterate through they keys, and populate your map
                for(String s : headerkeys){
                headers.put(s,response.getHeader(s));
                System.debug('header: ' + s + ' value: ' + response.getHeader(s));
                }
        System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus()+'ERROR'+response.getBody());
    } 
    else {
      
        Map < String, Object > deserializedMap = (Map < String, Object > ) JSON.deserializeUntyped(response.getBody());
        if (deserializedMap.containsKey('access_token')) {
            System.debug('deserializedMap.get(access_toke)---> ' + deserializedMap.get('access_token'));
            return String.valueOf(deserializedMap.get('access_token'));
        }

    }
    return null;


    }

    @AuraEnabled(cacheable=true)
    public static String getUserData(){
    HttpRequest request = new HttpRequest();
    String url=HRIS_SuccessFactorEndPoints.HRIS_SuccessFactorBaseUrl+HRIS_SuccessFactorEndPoints.HRIS_FIELDS+HRIS_SuccessFactorEndPoints.HRIS_SuccessFactor_EXPANDCLAUSE+HRIS_SuccessFactorEndPoints.HRIS_SuccessFactor_WHERECLAUSE;
    String whitespaceEscaped = url.replace(' ', '%20');
    request.setEndpoint(whitespaceEscaped);
    request.setMethod('GET');
    request.setHeader('Authorization', 'Bearer '+getBearerToken());
    request.setTimeout(120000);
    Http http = new Http();
    HttpResponse response = http.send(request);
    HRIS_SuccessFactorTodoEntryV2Wrapper resWrapper =new HRIS_SuccessFactorTodoEntryV2Wrapper ();
    // If the request is successful, parse the JSON response.
    if(response.getStatusCode() == HRIS_SuccessFactorEndPoints.OK) {
        resWrapper = (HRIS_SuccessFactorTodoEntryV2Wrapper) JSON.deserialize(response.getBody().replaceAll('__metadata','meta'), HRIS_SuccessFactorTodoEntryV2Wrapper.class);
        System.debug('Received the following meta:'+resWrapper.d.results[0].meta);
        System.debug('Received the following userId:'+resWrapper.d.results[0].userId);  
        System.debug('Received the following categoryId:'+resWrapper.d.results[0].categoryId); 
       // System.debug('Received the following deeplink[0]:'+resWrapper.d.results[0].wfRequestNav.wfRequestUINav.deeplink);  
    }

    return JSON.serialize(resWrapper);
    }


    }