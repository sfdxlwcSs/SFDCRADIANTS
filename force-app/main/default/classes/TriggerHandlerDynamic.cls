public class TriggerHandlerDynamic {
    static final String ACCOUNT_OBJ='Account';
    
    public static void determinesObjectTypeHandler(List<SObject> records, Map<Id, SObject> oldMap){
        Schema.SObjectType sObjectType = oldMap.values().getSObjectType();
        System.debug('sObjectTypeMap--'+sObjectType);
        
        for(SObject so:records){
            if(String.valueOf(sObjectType)==ACCOUNT_OBJ){
                Account acc = (Account)so;
                System.debug('sObjectTypeMap--'+acc.Name);
            }
            else{
                Contact con = (Contact)so;
                System.debug('sObjectTypeMap--'+con.Phone);
            }
        }
        
        
    }
    
}