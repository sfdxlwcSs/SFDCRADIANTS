trigger ProjectTriggerOptimized on Project__c (before insert,before delete, before update, 
          after insert, after update, after delete, after undelete) {
              
  Set<Id> siteIds=new Set<Id>(); 
  List<Site__c> sitesList = new List<Site__c>();
  Map<Id,List<Project__c>>  siteMapHasProjects=new Map<Id,List<Project__c>>(); 
              
  if(Trigger.isBefore){
      if(Trigger.isDelete){
          
      }
     if(Trigger.isInsert){
          for(Project__c objD:Trigger.new){
              System.debug('Billing_Rate__c-->'+objD.Billing_Rate__c);
              objD.Billing_Rate__c=1;
               System.debug('Billing_Rate__c-->2'+objD.Billing_Rate__c);
          }
        
      }  
      
  }
    //isAfter
  else{
      //optimization
       List<Project__c> projList =Trigger.isDelete?Trigger.old :Trigger.new;
      
              for(Project__c objD:projList){
                    if(objD.Site__c!=null){
                      siteIds.add(objD.Site__c);
                    }
                  if(Trigger.isUpdate){  
                  //for old site that got unlinked
                       if(Trigger.oldMap.get(objD.Id).Site__c!=objD.Site__c){
                          siteIds.add(Trigger.oldMap.get(objD.Id).Site__c);
                     }
                  }
              }
         
  }
 
  for(Site__c s:[Select Id,Number_of_Projects__c,Site_Status__c,(Select Id,In_Service_A__c,Site__c From Projects__r) 
                 From Site__c Where Id IN:siteIds]){
                 
                     //if site has projects related
               if (!s.Projects__r.isEmpty()){
                         for(Project__c  pro:s.Projects__r){
                             if(pro.In_Service_A__c<>null){
                                 if(siteMapHasProjects.containsKey(pro.Site__c)){
                                     siteMapHasProjects.get(pro.Site__c).add(pro);
                                 }
                                 else{
                                     siteMapHasProjects.put(pro.Site__c, new List<Project__c>{pro}) ;
                                 }
                             } 
                         }//project count loop  
                     } //if site has projects related
                     
                      // Atleast 1 Project with In_Service_A__c date value
                     if(siteMapHasProjects.containsKey(s.Id))
                     {
                         s.Site_Status__c='On Air'; 
                     }
                     else
                     {
                         s.Site_Status__c='Pending'; 
                     } 
                    s.Number_of_Projects__c=s.Projects__r.size();
                    
                     sitesList.add(s);
                 }  //site loop                                    
  
  Update sitesList;

}