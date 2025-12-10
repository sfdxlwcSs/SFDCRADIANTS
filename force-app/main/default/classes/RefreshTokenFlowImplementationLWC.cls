public with sharing class RefreshTokenFlowImplementationLWC {

    // Simple DTO for query results
    public class QueryResult {
        public Integer totalSize;
        public Boolean done;
        public List<sObjectRecord> records;
    }
    public class sObjectRecord {
        public String Id;
        public String Name;
    }

    // Fetch first 5 Accounts (Id, Name)
    public static List<sObjectRecord> fetchTop5() {
        // Build request to the REST Query API
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        // Replace 'RefreshTokenNamedCredential' with your Named Credential API Name
        String soql = 'SELECT Id, Name FROM Account LIMIT 5';
        String endpoint = 'callout:RefreshTokenNamedCredential/services/data/v64.0/query?q=' 
                          + EncodingUtil.urlEncode(soql, 'UTF-8');
        req.setEndpoint(endpoint);
        req.setHeader('Accept', 'application/json');

        HttpResponse res = new Http().send(req);
        if (res.getStatusCode() == 200) {
            QueryResult qr = (QueryResult) JSON.deserialize(res.getBody(), QueryResult.class);
            System.debug('response➡️'+qr.records);
            return qr.records;
        } else {
            System.debug(LoggingLevel.ERROR, 'REST call failed: ' + res.getStatus() + ' body=' + res.getBody());
            throw new CalloutException('Salesforce REST API error: ' + res.getStatus());
        }
    }
}