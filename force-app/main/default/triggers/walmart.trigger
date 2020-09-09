trigger walmart on Contact (after insert,after update) {
    Map<Id,String> accountMap=new Map<Id,String>();
    set<Id> setAcc=new Set<Id>();
    List<Account> toUpdateAcc=new List<Account>();
    for(Contact c:trigger.new){
        setAcc.add(c.AccountId);   
    }
      //always check before issuing a soql
    if(setAcc.size()>0){
        for(Contact c:[Select id,AccountId,FirstName from contact where AccountId IN:setAcc ]){
            if(accountMap.containsKey(c.AccountId)){
                accountMap.put(c.AccountId,accountMap.get(c.AccountId)+','+c.FirstName);
            }
            else{
                accountMap.put(c.AccountId,c.FirstName);
            }
        }
    }
    //always check before issuing a soql
    if(accountMap.keySet().size()>0){
        for(Account acc:[Select Id,allcontacts__c from Account where Id In:accountMap.keySet()]){
            acc.allcontacts__c=accountMap.get(acc.Id);
            toUpdateAcc.add(acc);
        }
        Update toUpdateAcc;     
    }   
    
}