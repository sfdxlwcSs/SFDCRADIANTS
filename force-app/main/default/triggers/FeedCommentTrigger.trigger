/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 14-03-2023
 * @last modified by  : Somnath Sharma
**/
trigger FeedCommentTrigger on FeedComment  (after insert) {
    
    List<RecordRefreshEvent__e> eventList = new List<RecordRefreshEvent__e>();
    Set<Id> caseSet=new Set<Id>();
    for (FeedComment obj : Trigger.new) {
        eventList.add(
            new RecordRefreshEvent__e( RecordId__c = obj.ParentId,
            sObject__c='Case')
        );
        caseSet.add(obj.ParentId);
    }

   List<Case> toUpdateList=new List<Case>();
   for(Case caseObj:[Select Id,Status From Case Where Id IN: caseSet]){
    caseObj.Status='Working';
    toUpdateList.add(caseObj);
   }
   Update toUpdateList;
   EventBus.publish(eventList);
   
    

}