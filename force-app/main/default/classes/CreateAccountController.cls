/**
* @File Name          : CreateAccountController.cls
* @Description        : 
* @Author             : Somnath Sharma
* @Group              : 
* @Last Modified By   : Somnath Sharma
* @Last Modified On   : 12/26/2019, 10:14:56 AM
* @Modification Log   : 
* Ver       Date            Author                 Modification
* 1.0    12/24/2019   Somnath Sharma     Initial Version
**/
public with sharing class CreateAccountController {
    
    
    @AuraEnabled(cacheable=true)
    public static String saveAccount(String Name, String AccountNumber,
                                     String Description,String Website) {
        partnerSoapSforceCom.soap myconnection=new partnerSoapSforceCom.soap();
        partnerSoapSforceCom.LoginResult  myLoginDetails=myconnection.login('somnath1690@gmail.com','Debasree@162DPWqjUoCOSEAkmrfkl2qUh3');
        System.debug('SessionIdReceived'+myLoginDetails.sessionId);
        String sessionId=myLoginDetails.sessionId;
        soapSforceComSchemasClassCreateAcc.SessionHeader_element  headerInfo=new soapSforceComSchemasClassCreateAcc.SessionHeader_element();
        headerInfo.sessionId=sessionId;
        soapSforceComSchemasClassCreateAcc.accoutCreate newAcc=new soapSforceComSchemasClassCreateAcc.accoutCreate();
        newAcc.SessionHeader=headerInfo;
        String response=newAcc.createAccount(Name,AccountNumber,Description,Website);
        return response;
    }
}