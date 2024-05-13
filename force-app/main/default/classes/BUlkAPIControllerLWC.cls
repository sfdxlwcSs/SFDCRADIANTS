public with sharing class BUlkAPIControllerLWC {
    @AuraEnabled(cacheable=true)
    public static List<RecordWrapper> queryAccRecs(String nextLocator) {
        String endpoint = '/services/data/v58.0/jobs/query/750GC00000sCxmkYAC/results?maxRecords=11';
        if (String.isNotBlank(nextLocator)) {
            endpoint += '&locator=' + nextLocator;
        }
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            List<RecordWrapper> accRecsWrapper = new List<RecordWrapper>();
            String body = response.getBody();
            String[] accountData = body.split('\n');
            for (Integer i = 1; i < accountData.size(); i++) {
                String[] csvData = accountData[i].replace('"', '').split(',');
                accRecsWrapper.add(new RecordWrapper(i, csvData[0], csvData[1]));
            }
            return accRecsWrapper;
        } else {
            throw new AuraHandledException('Error fetching records: ' + response.getStatus());
        }
    }
    
    public class RecordWrapper {
        @AuraEnabled
        public Integer index { get; set; }
        @AuraEnabled
        public String recordId { get; set; }
        @AuraEnabled
        public String recordName { get; set; }
       /*
        public String Rating { get; set; }
         public String Type { get; set; }
         public String Industry { get; set; }*/
        
        public RecordWrapper(Integer index, String recordId, String recordName) {
            this.index = index;
            this.recordId = recordId;
            this.recordName = recordName;
        }
    }
}