trigger SiteTrigger on Site__c (before update,before insert) {
    
     Set<Id> siteIds=new Set<Id>(); 
    for(Site__c obj:Trigger.new){
        
        System.debug('n'+obj.Number_of_Projects__c);
        
        if( Trigger.isInsert )
        {
            if(Trigger.isBefore){
                obj.Number_of_Projects__c=0;
            }
            
        }
        else if ( Trigger.isUpdate )
        {
            if(Trigger.isBefore)
            {
                
            }
        }
        
    }
    
           
    }