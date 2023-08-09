/**
 * @description       : 
 * @author            : SOMNATH SHARMA
 * @group             : 
 * @last modified on  : 08-08-2023
 * @last modified by  : SOMNATH SHARMA
**/
public with sharing class AccountController {

    @AuraEnabled(cacheable=true)    
    public static List<Account> getAccounts(){
        return [select id,name,type,phone,industry from Account limit 10];
    }
    
}