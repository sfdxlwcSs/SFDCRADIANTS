/**
* @File Name : TestObjectCreator.cls
* @Description :
* @Author :
* @Last Modified By :The Apex class is marked with sharing, so it respects record-level sharing.
But since you're creating a new record, sharing rules don’t apply yet — the record doesn’t exist.
Apex does not automatically check whether the user has Create access on the object or access to fields.
So unless you explicitly check permissions using Schema.sObjectType.TestObject__c.isCreateable() or isAccessible() for fields, Apex will proceed with the insert.
* @Last Modified On : October 17, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | October 17, 2025 |   | Initial Version
**/

public without sharing class TestObjectCreator {

    @AuraEnabled
    public static String createTestObject(String name, String status) {
        if (!Schema.sObjectType.TestObject__c.isCreateable()) {
            throw new AuraHandledException('You do not have permission to create TestObject__c records.');
        }

        if (!Schema.sObjectType.TestObject__c.fields.Status__c.isAccessible()) {
            throw new AuraHandledException('You do not have access to Status__c field.');
        }

        TestObject__c obj = new TestObject__c();
        obj.Name = name;
        obj.Status__c = status;
        insert obj;
        return obj.Id;
    }
    
    
  @AuraEnabled(cacheable=true)
    public static List<TestObject__c> getTestObjects() {
        return [SELECT Id, Name, Status__c FROM TestObject__c ORDER BY CreatedDate DESC LIMIT 10];
    }

}