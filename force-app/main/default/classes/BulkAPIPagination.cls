public class BulkAPIPagination {
    
    public String [] accountData= new String[]{};
    public List<RecordWrapper> accRecsWrapper{set;get;}
    String nextlocator='';
    Integer clickTracker=0;
    Map<Integer,String> locaterMap=new Map<Integer,String>{0=>null};
    public Boolean disablePrevious{set;get;}
    public BulkAPIPagination() {
        disablePrevious=true;
    }
    
     public  String formEndpoint(){
         
        
        String endPoint=System.URL.getOrgDomainUrl().ToExternalForm()+'/services/data/v58.0/jobs/query/750GC00000sCzVeYAK/results?maxRecords=11';
        system.debug('nextlocator-'+nextlocator);
        if(String.isNotBlank(nextlocator)){
            system.debug('nextlocator2-'+nextlocator);
            endPoint+='&locator='+ nextlocator;
        }
        
        return endPoint;
    }
    
    public  void queryAccRecs(){
        
        
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer '+UserInfo.getSessionId());
        req.setEndpoint(formEndpoint());
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse response = http.send(req);
        if(response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus()+'ERROR'+response.getBody());
        }
        else{
           // System.debug('Response--> '+response.getBody());
            String body=response.getBody();
            nextlocator=response.getHeader('Sforce-Locator');
            
            formatResponse(body);
            
        }
      
    }
    
    
    public  void Next(){
         clickTracker=clickTracker+1;
        if(String.isNotBlank(nextlocator) && !locaterMap.containsKey(clickTracker)){
                locaterMap.put(clickTracker,nextlocator);   
            }
          system.debug('locaterMap-'+locaterMap);
          System.debug('NextResponse--> '+clickTracker);
        if(clickTracker>0){
             disablePrevious=false;
        }
        queryAccRecs(); 
    }
    
    public  void Previous(){
         clickTracker=clickTracker-1;
        if(clickTracker==0){
             disablePrevious=true;
        }
         nextlocator=locaterMap.get(clickTracker);
          system.debug('Previousnextlocator-'+nextlocator);
         queryAccRecs();
          System.debug('PreviousResponse--> '+clickTracker);
    }
    
   
    
    public  void formatResponse(String body){
        
        accRecsWrapper=new List<RecordWrapper>();
        accountData=body.split('\n');
        for(Integer i=1;i<accountData.size();i++){
            accountData[i]=accountData[i].replace('"', '');
            String [] csvData=accountData[i].split(',');
            accRecsWrapper.add(new RecordWrapper(
                i,
                csvData[0],
                csvData[1],
                 csvData[2], 
                 csvData[3] ,
                 csvData[4] 
            ));
        }
    }
    
    public class RecordWrapper {
        public Integer index { get; set; }
        public String recordId { get; set; }
        public String recordName { get; set; }
          public String Type { get; set; }
          public String Industry { get; set; }
            public String Rating { get; set; }
        
       
        
        public RecordWrapper(Integer index, String recordId, String recordName,String Type,String Industry,String Rating) {
            this.index = index;
            this.recordId = recordId;
            this.recordName = recordName;
            this.Type = Type;
            this.Industry = Industry;
            this.Rating = Rating;
        }
    }
    
}