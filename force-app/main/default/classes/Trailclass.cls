/**
 * @File Name          : Trailclass.cls
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 16-11-2022
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    29/1/2020   Somnath Sharma     Initial Version
**/
public with sharing class Trailclass {
   
   @AuraEnabled
   public static string methodName(){
       return 'Yes Git';
   }

   @AuraEnabled(cacheable = true)
    public static Account getSingleAccount(Id accId){       
        return [SELECT Id, Name, Industry
                FROM Account 
                WHERE Id =: accId];
    }
}