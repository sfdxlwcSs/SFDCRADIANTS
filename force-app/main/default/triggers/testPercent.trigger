trigger testPercent on Account (before Update) {

for(Account acc:Trigger.new){
  if(acc.percentFieldTest__c>0){
    acc.Stages__c='Open';
  }
}

}