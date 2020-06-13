public class TriggerHandlerDynamic {
    public static Boolean isFirstTime = true;
    static final String ACCOUNT_OBJ='Account';
    
    public static void determinesObjectTypeHandler(List<SObject> records, Map<Id, SObject> oldMap){
     //   Schema.SObjectType sObjectType = oldMap.values().getSObjectType();
      

      
        List<Account> accList=new List<Account>();
        for(SObject so:records){
            String sobjectType = so.getSObjectType().getDescribe().getName();
              System.debug('sObjectTypeMap--'+sobjectType);
            if(String.valueOf(sobjectType)==ACCOUNT_OBJ){
                Account acc = (Account)so;
                System.debug('sObjectTypeMap--'+acc.Name);
                accList.add(acc);
            }
            else{
                Contact con = (Contact)so;
                System.debug('sObjectTypeMap--'+con.Phone);
            }
        }
       
       
          
             sendTemplate(accList);
       
       
    }
    
    
       
    public static void sendTemplate( List<Account> accList){
        
        for(Account acc : accList) {
            
            acc.UpsellOpportunity__c = 'Yes';
           
        }
       
         
       
    }    
    
    
}