trigger SubProject on SubProject__c (after insert, after update, after delete, after undelete) {
    
    List<SubProject__c> subProjList=Trigger.Isdelete?Trigger.Old:Trigger.new;
    List<Project__c> projectToUpdate = new List<Project__c>();
    Set<Id> proIds=new Set<Id>();
    for(SubProject__c obj:subProjList){
        if(obj.Project__c<>null){
            proIds.add(obj.Project__c); 
        }
            if(Trigger.Isupdate){
                if(Trigger.oldMap.get(obj.Id).Project__c<>obj.Project__c){
                     proIds.add(Trigger.oldMap.get(obj.Id).Project__c); 
                }
            
        } 
       
    }
    for(Project__c obj:[Select Id, Project_Start_A__c,(Select Id,LastModifiedDate,CreatedDate,SubProjectStart__c From SubProjects__r) 
                        From Project__c Where Id IN: proIds ]){
        
    }

}