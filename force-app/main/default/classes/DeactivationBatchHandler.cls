public class DeactivationBatchHandler {
    
    static final String OPPORTUNITY_OBJ='Opportunity';
    static final String LEAD_OBJ='Lead';
    static final Integer  DUE_DAYS=28;
    public static List<Opportunity> oppsToUpdate = new List<Opportunity>();
    public static List<Lead> leadsToUpdate = new List<Lead>();
    
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
             if( isDateDue(opp.CreatedDate)){
                System.debug('sObjectTypeOpportunity--'+opp.Id);
                 oppsToUpdate.add(opp);
            }
        }     
    } 
    
    public static void leadBatchHandler(List<SObject> records){
        
        for(SObject so:records){ 
            Lead ld = (Lead)so;
            if( isDateDue(ld.CreatedDate)){
                 System.debug('sObjectTypLead--'+ld.Id);   
                 leadsToUpdate.add(ld);
            }
        }  
        if(leadsToUpdate.size()>0){
            updateLeadsToInactive();
        }
    }
    
    public static Boolean isDateDue(DateTime soBjectCreatedDate ){
          Date dueDate=Date.today();
          DateTime dT = soBjectCreatedDate;
          Date startDate = date.newinstance(dT.year(), dT.month(), dT.day());
          Integer numberDaysDue = startDate.daysBetween(dueDate);
          System.debug('numberDaysDue---->'+numberDaysDue );
          return  numberDaysDue>DUE_DAYS? true : false;
    }
    
    public static void  updateLeadsToInactive(){
        for(Lead ld:leadsToUpdate){
           ld.Active__c=false; 
        }
        Update leadsToUpdate;
    }
}