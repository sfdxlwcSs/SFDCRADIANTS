public with sharing class UtilityCode {
    // trigger CustomObjectTrigger on Custom_Object__c (before insert, before update, after insert, after update, before delete) {

    //     if (Trigger.isBefore) {
    //         if (Trigger.isInsert) {
    //             // Logic before records are inserted
    //             for (Custom_Object__c record : Trigger.new) {
    //                 // Your before insert logic here
    //             }
    //         } else if (Trigger.isUpdate) {
    //             // Logic before records are updated
    //             for (Custom_Object__c oldRecord : Trigger.old) {
    //                 // Your before update logic here
    //             }
    //             for (Custom_Object__c newRecord : Trigger.new) {
    //                 // Your before update logic here
    //             }
    //         } else if (Trigger.isDelete) {
    //             // Logic before records are deleted
    //             for (Custom_Object__c record : Trigger.old) {
    //                 // Your before delete logic here
    //             }
    //         }
    
    //     } else if (Trigger.isAfter) {
    //         if (Trigger.isInsert) {
    //             // Logic after records are inserted
    //             for (Custom_Object__c record : Trigger.new) {
    //                 // Your after insert logic here
    //             }
    //         } else if (Trigger.isUpdate) {
    //             // Logic after records are updated
    //             for (Custom_Object__c record : Trigger.new) {
    //                 // Your after update logic here
    //             }
    //         } else if (Trigger.isDelete) {
    //             // Logic after records are deleted
    //             for (Custom_Object__c record : Trigger.old) {
    //                 // Your after delete logic here
    //             }
    //         }
    //     }
    // }
    
    // In Salesforce Apex, you can convert a Set to a comma-separated string by using the String.join method. Here's an example:
    // Set<String> mySet = new Set<String>{'apple', 'orange', 'banana'};
    
    // // Convert Set to comma-separated string
    // String commaSeparatedString = String.join(new List<String>(mySet), ',');
    
    // System.debug(commaSeparatedString);

    // switch on Trigger.operationType{
    //     when AFTER_INSERT{
    //         issuesDataBasedOnTriggerContext=Trigger.new;
            
    //     }
    //     when AFTER_UPDATE{
    //         issuesDataBasedOnTriggerContext=Trigger.new;
            
    //     }
    //     when AFTER_UNDELETE{
    //         issuesDataBasedOnTriggerContext=Trigger.new;
            
    //     }
    //     when AFTER_DELETE{
    //         System.debug('came here AFTER_DELETE');
    //         issuesDataBasedOnTriggerContext=Trigger.old;
    //     }

//     String s1='Apple,Orange,Lemon,Banana';
// Set<String> sets=new Set<String>{'Apple','Orange','Lemon','Banana'};
// Integer maxLength=20;
// String s2 = s1.substringAfterLast(',');
// System.debug('-0'+s2);
// String finaloutput=s1.substring(0,20);
// System.debug('-1'+finaloutput);
// System.debug('-1.1'+finaloutput.substringAfterLast(','));
// System.debug('-2'+s1.substringBeforeLast(','));
// if(s2!=finaloutput.substringAfterLast(',')){
// finaloutput=finaloutput.substringBeforeLast(',');
// }
// System.debug('--->'+finaloutput);
    }
    
}