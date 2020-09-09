global class CustomIterable implements Iterable<SObject>{ 
    
    
    global Iterator<SObject> iterator() {
        return new LeadsOpportunitiesIteratorIterable();
    }
    global class LeadsOpportunitiesIteratorIterable implements Iterator<SObject>{
        List<SObject> recordList {get; set;} 
        Integer i {get; set;} 
        
        public LeadsOpportunitiesIteratorIterable(){ 
            recordList=new List<SObject>();
            recordList.addAll([SELECT id, LeadSource FROM Opportunity]);
            recordList.addAll([SELECT id, Rating FROM Lead]);
            
            i = 0; 
        }   
        global boolean hasNext(){ 
            if(i >= recordList.size()) 
                return false; 
            else 
                return true; 
        }    
        global SObject next(){ 
            
            i=i+1; 
            return recordList[i-1]; 
        } 
    }
    
}