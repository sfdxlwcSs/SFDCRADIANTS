public class UpdateQueuableAccount implements Queueable {
    
    private List<Account> accounts;
    
    public UpdateQueuableAccount(List<Account> records) {
        this.accounts = records;
       
    }
    public void execute(QueueableContext context) {
        //Ensure we don't have an endless loop, prevent the trigger from firing again
         SingleExecution.isAlreadyDone=true;
        //if we want Read only record to be updated then below approach
        List<Account> acctList = new List<Account>();
        for (Account account : accounts) {
            Account a = new Account(Id = account.Id);
            a.Rating = 'Cold';
            acctList.add(a);
          // perform other processing or callout
        }
        System.debug('updated account'+acctList);
       update acctList;
    }
    
}