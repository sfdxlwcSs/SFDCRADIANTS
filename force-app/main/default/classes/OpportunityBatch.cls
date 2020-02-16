global class OpportunityBatch implements Database.Batchable<Sobject>{
 
    //Method to get the data to be proceesed  
    global database.Querylocator Start(Database.BatchableContext bc){
        String query = 'Select Id, Name From Lead';
        return Database.getQueryLocator(query);
    }
 
 
    //Method to execute the batch
    global void execute(Database.BatchableContext bc, Sobject[] scope){
        String  dataExists=scope.size()>0?'Yes':'No';
        System.debug('dataExistsInBatch'+dataExists);
        if(scope.size()>0){
             OpportunityBatchHandler.determinesObjectTypeHandler(scope);
        }
       
    }
 
    //Method to be called after the excute
    global void finish(Database.BatchableContext bc){
        //Add your start code for the other batch job here
       // Database.executeBatch(new Batch2());
    }
}