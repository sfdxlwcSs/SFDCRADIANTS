public class AccountInfoFetcher {
    public static final String END_POINT = 'https://somnathintegrationorg2-dev-ed.develop.my.salesforce.com';
    
    public static HttpResponse getAccountInfo(String accessToken, String accountId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // Set the endpoint URL
        String url = END_POINT + '/services/data/v54.0/sobjects/Account/' + accountId;
        request.setEndpoint(url);
        
        // Set the method to GET
        request.setMethod('GET');
        
        // Set the Authorization header with the access token
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        
        // Send the request
        HttpResponse response = http.send(request);
        
        // Check the response status
        if (response.getStatusCode() == 200) {
            // Parse the response
            System.debug('Account Info: ' + response.getBody());
        } else {
            System.debug('Failed to fetch account info. Status: ' + response.getStatus());
            System.debug('Response: ' + response.getBody());
        }
        
        return response;
    }
}