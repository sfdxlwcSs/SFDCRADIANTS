trigger FeedItem on FeedItem (before delete) {
    
    for(FeedItem obj:Trigger.Old){
        obj.addError('You cannot see me');
    }
}