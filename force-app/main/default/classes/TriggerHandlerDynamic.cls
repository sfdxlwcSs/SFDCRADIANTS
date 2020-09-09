public class TriggerHandlerDynamic {
    static final String ACCOUNT_OBJ='Account';
    public static void determinesObjectTypeHandler(List<SObject> records, Map<Id, SObject> oldMap){
        System.debug('SingleExecution'+SingleExecution.isAlreadyDone);       
       //Only have the trigger fire once (lots of ways to do this, could be criteria this is a simple example
          if(SingleExecution.isAlreadyDone) return;
      //  Schema.SObjectType sObjectType = oldMap.values().getSObjectType();
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
      UpdateQueuableAccount updateJob = new UpdateQueuableAccount(records);
      System.enqueueJob(updateJob);
    }

       
        
    
    
}