/**
* @File Name          : ContentController.cls
* @Description        : to identify accounts which have atatchments
* @Author             : Somnath Sharma
* @Group              : 
* @Last Modified By   : Somnath Sharma
* @Last Modified On   : 22/5/2020, 6:12:09 pm
* @Modification Log   : 
* Ver       Date            Author      		    Modification
* 1.0    22/5/2020   Somnath Sharma     Initial Version
**/
public with sharing class ContentController {
    
    @AuraEnabled 
    public static List<wrapperClass> getAccList(){
        
        List <Account> accList=[Select Name,Id From Account];
        return hasFileIds(accList);
        
    }

   @AuraEnabled 
    public static Account getLongTextFieldData(String accId){
        
        
        return [SELECT test_long__c  FROM Account WHERE Id =: accId];
        
    }    
    private static List<wrapperClass> hasFileIds(List<Account> accList){
        Map<String,wrapperClass> wrapperClassMap =new Map<String,wrapperClass>();
        for(Account obj:accList){
            // accIdSet.add(obj.Id);
            wrapperClass objWrap=new wrapperClass();
            objWrap.accId=obj.Id;
            objWrap.Name=obj.Name;
            objWrap.fileAttached=false;
            wrapperClassMap.put(obj.Id,objWrap);
        }
        for(ContentDocumentLink cdl:[SELECT Id,LinkedEntityId FROM ContentDocumentLink  where 
                                     LinkedEntityId IN :wrapperClassMap.keySet()]){
            wrapperClassMap.get(cdl.LinkedEntityId).fileAttached=true;
        }                  
        return wrapperClassMap.values();
        
    }
    
    public class wrapperClass{
        @AuraEnabled public String accId;
        @AuraEnabled public Boolean fileAttached;
        @AuraEnabled public String Name;
    }
}