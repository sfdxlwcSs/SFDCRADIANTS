/**
 * @File Name          : tableFiltersController.cls
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 26/1/2020, 6:12:58 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    1/23/2020   Somnath Sharma     Initial Version
**/
public with sharing class TableFiltersController {

@AuraEnabled
    public static List<SObject> getDataBasedOnSobject(String sobjectName,String whereClause,
                                                      String orderByClause,Integer limitClause){
        List<SObject>  sObjectRowsList=new List<SObject>();
        String query='Select Name From';
        query=query+' '+sobjectName+' Where '+whereClause;
        if(String.isNotBlank(orderByClause)){
           query=query+' '+orderByClause+' ';
        }
       if(limitClause>0){
           query=query+' '+'Limit '+limitClause;
        } 
        system.debug('Final QUERY-->'+query);
        sObjectRowsList = Database.query(query);
        System.debug('Rows'+sObjectRowsList);
        
      return sObjectRowsList;
    }

    @AuraEnabled(cacheable=true)
     public static List<String> getPickListValueBasedOnSobject(String sobjectAPI,String pickListFieldAPI){
      List<String>  pickListValues=new List<String>();   
      Schema.SObjectType s = Schema.getGlobalDescribe().get(sobjectAPI) ;
      Schema.DescribeSObjectResult r = s.getDescribe() ;
      Map<String,Schema.SObjectField> fields = r.fields.getMap() ;
      Schema.DescribeFieldResult fieldResult = fields.get(pickListFieldAPI).getDescribe();
      List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
      for( Schema.PicklistEntry pickListVal : ple){
        pickListValues.add(pickListVal.getLabel());
      } 
       System.debug(pickListValues);  
       return   pickListValues; 
                                                      
    }

    
}