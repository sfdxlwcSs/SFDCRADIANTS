@isTest
public class AccountPercentTrigggerTest {
    @isTest static void myTest() {
       Account testAccount = new Account();
 testAccount.Name='Test Account' ;
        testAccount.percentFieldTest__c=10;
 insert testAccount;
        Test.startTest();
          testAccount.percentFieldTest__c=12.50;
        Update testAccount;
        
        Test.stopTest();
        Account acc=[Select Id ,Stages__c,percentFieldTest__c From Account];
        System.assertEquals(acc.Stages__c,'Open');
        System.assert(acc.percentFieldTest__c==12.5,'conditionnotmet');
         //this lead to failure
       // System.assertEquals(acc.percentFieldTest__c,12.5);


    }
}