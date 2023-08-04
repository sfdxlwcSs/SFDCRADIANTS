public class ButtonActionController {
    public Account acc { get; set; }
    public Account getAccount() {      
        acc = [SELECT Id, Name, Type, AccountSource FROM Account WHERE Name = 'Account IP POC0'];return acc; 
    }
    public PageReference save() { 
        update acc;      
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, acc.Name + ' account has been updated.'));
        return null;   
    }
}