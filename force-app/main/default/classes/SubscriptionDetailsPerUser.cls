/**
 * @File Name          : SubscriptionDetailsPerUser.cls
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 21/1/2020, 10:07:16 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    21/1/2020   Somnath Sharma     Initial Version
**/

public with sharing class SubscriptionDetailsPerUser {
  //wrapper class
     public class EntitySubscriptionWrapper {
    //Name of record[ParentId]
    @AuraEnabled public String recName{get;set;}
    @AuraEnabled public Id entityId{get;set;}   //EntitySubscription Id
    @AuraEnabled public String  recObjectType{get;set;}//ParentId object Name
    @AuraEnabled public Date  followedDate{get;set;}
    @AuraEnabled public String  parentId {get;set;}//user id of the subscriber
    @AuraEnabled public String  createdByName {get;set;}
    }
  /**
  * @description: get List of records per object user is following
  * @author: Somnath Sharma | 12/17/2019 
  * @param :
  * @return //Wrapper 
  **/
 
    @AuraEnabled(cacheable=true)
    public static Map<String,List<EntitySubscriptionWrapper>> getCallerUserfollowings(){
        Map<String,List<EntitySubscriptionWrapper>> objectEntitySubscriptionMap=new Map<String,List<EntitySubscriptionWrapper>>();
       List<EntitySubscriptionWrapper> entitySubscriptionWrapperList=new List<EntitySubscriptionWrapper>();
           for(EntitySubscription entity:[Select Id,CreatedBy.Name,CreatedDate,ParentId,parent.name,
                                          subscriber.name,SubscriberId FROM EntitySubscription 
                                          where SubscriberId =: UserInfo.getUserId() ORDER BY CreatedDate DESC])
                {    
                  //name of the object to which user is subscribed   
                 String sObjName = entity.ParentId.getSObjectType().getDescribe().getLabel(); 
                  EntitySubscriptionWrapper obj =new EntitySubscriptionWrapper();
                  obj.entityId=entity.Id;
                  obj.parentId=entity.ParentId;
                  obj.recObjectType=sObjName;
                  obj.recName=entity.parent.name;
                  obj.createdByName=entity.CreatedBy.Name; 
                  obj.followedDate=date.newinstance(entity.CreatedDate.year(), entity.CreatedDate.month(), entity.CreatedDate.day());
                    entitySubscriptionWrapperList.add(obj); 
                 }
                 if(entitySubscriptionWrapperList.size()>0){
                  objectEntitySubscriptionMap=SubscriptionDetailsPerUser.formGetFollowingMap(entitySubscriptionWrapperList);
                 }
                System.debug('EntityValues'+objectEntitySubscriptionMap.values()); 
    return objectEntitySubscriptionMap;
  }
/**
* @description form that map of list of records that user is following for a particular object
* @author Somnath Sharma | 12/17/2019 
* @param entitySubscriptionWrapperList 
* @return //map 
**/
   public static Map<String,List<EntitySubscriptionWrapper>> formGetFollowingMap(List<EntitySubscriptionWrapper> entitySubscriptionWrapperList){   
    Map<String,List<EntitySubscriptionWrapper>> objectEntitySubscriptionMap=new Map<String,List<EntitySubscriptionWrapper>>();
      for(EntitySubscriptionWrapper entity:entitySubscriptionWrapperList){
//object name is the key
            if(objectEntitySubscriptionMap.ContainsKey(entity.recObjectType))
                {   
                  objectEntitySubscriptionMap.get(entity.recObjectType).add(entity);     
                }
                else
                {
                  objectEntitySubscriptionMap.put(entity.recObjectType,new List<EntitySubscriptionWrapper>{entity}); 
                }
      }
       System.debug('EntityObjects'+objectEntitySubscriptionMap.keySet());  
    return objectEntitySubscriptionMap;
   }

/**
* @description 
* @author Somnath Sharma | 12/17/2019 
* @param entityIds 
* @return String//
**/
@AuraEnabled
public static String  unSubscribe(List<Id> entityIds) {
        List<EntitySubscription> listEntitySub = new List<EntitySubscription>();
        listEntitySub = [SELECT Id FROM EntitySubscription WHERE  Id IN:entityIds];
        if(listEntitySub.size() > 0) {
            delete listEntitySub;
            return 'UnSubscribed';
        } else {
            return 'You are not subscribed to this';
        }
    }
}