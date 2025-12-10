public class ButtonActionController {
    public Account acc { get; set; }
    public Account getAccount() {      
        acc = [SELECT Id, Name, Type, AccountSource FROM Account WHERE Name Like '%Account IP%'  order by lastmodifieddate asc Limit 1];return acc; 
    }
    public PageReference save() { 
        update acc;      
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO, acc.Name + ' account has been updated.'));
        return null;   
    }
}