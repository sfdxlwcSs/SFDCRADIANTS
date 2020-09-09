global class batchClassIterable implements Schedulable,Database.Batchable<sObject>,Database.Stateful{ 
    global  Set<Id> affiliateIds=new Set<Id>();
    global void execute(System.SchedulableContext sc){
        Database.executeBatch(new batchClassIterable(), 5);
    }
    global Iterable<SObject> start(Database.batchableContext info){ 
        return new CustomIterable(); 
    }   
    
    
    global void execute(Database.batchableContext info, List<SObject> scope){ 
        
        for(SObject item : scope){ 
            Id myId=item.Id;
            String sObjName = myId.getSObjectType().getDescribe().getName();
            if(sObjName =='Lead'){
                item.put('Rating', 'Cold');  
            }
            else{
                item.put('LeadSource', 'Other');
            }
            
        } 
        Database.update(scope, false);
    }     
    global void finish(Database.batchableContext info){   
        
    } 
}