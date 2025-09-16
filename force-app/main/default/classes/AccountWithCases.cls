// A public class to act as a wrapper for an Account and its related Cases.
public class AccountWithCases {
    // @AuraEnabled allows these properties to be accessible from Lightning components if needed.
    @AuraEnabled
    public Account accountRecord; // Holds the Account sObject.

    @AuraEnabled
    public List<Case> cases; // Holds the list of related Case sObjects.

    // Constructor to initialize the wrapper with an Account and its Cases.
    public AccountWithCases(Account acc, List<Case> caseList) {
        this.accountRecord = acc;
        this.cases = caseList;
    }
}