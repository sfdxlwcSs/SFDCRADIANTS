public class OpportunityBatchHandler {
    
     static final String OPPORTUNITY_OBJ='Opportunity';
     static final String LEAD_OBJ='Lead';
    public static void determinesObjectTypeHandler(List<SObject> records){
        Schema.SObjectType sObjectType = records.getSObjectType();
        System.debug('sObjectType--'+sObjectType);
            if(String.valueOf(sObjectType)==OPPORTUNITY_OBJ){
                  applicationBatchHandler(records);
            }
             if(String.valueOf(sObjectType)==LEAD_OBJ) {
                leadBatchHandler(records);
             }
        }    
    
    
    public static void applicationBatchHandler(List<SObject> records){
        for(SObject so:records){     
                Opportunity opp = (Opportunity)so;
                System.debug('sObjectTypeOpportunity--'+opp.Name);
            }     
        }     
     public static void leadBatchHandler(List<SObject> records){
         for(SObject so:records){
                Lead ld = (Lead)so;
                System.debug('sObjectTypLead--'+ld.Name);    
        }    
    }
}