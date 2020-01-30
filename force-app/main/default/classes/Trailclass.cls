/**
 * @File Name          : Trailclass.cls
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 29/1/2020, 7:05:22 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    29/1/2020   Somnath Sharma     Initial Version
**/
public with sharing class Trailclass {
   
   @AuraEnabled
   public static string methodName(){
       return 'Yes Git';
   }
}