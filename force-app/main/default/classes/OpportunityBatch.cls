/**
 * @File Name          : OpportunityBatch.cls
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 16/2/2020, 11:10:24 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    16/2/2020   Somnath Sharma     Initial Version
**/
global class OpportunityBatch implements Database.Batchable<Sobject>{
 
    //Method to get the data to be proceesed  
    global database.Querylocator Start(Database.BatchableContext bc){
        String query = 'Select Id, Name From Opportunity';
        return Database.getQueryLocator(query);
    }
 
 
    //Method to execute the batch
    global void execute(Database.BatchableContext bc, Sobject[] scope){
        String  dataExists=scope.size()>0?'Yes':'No';
        System.debug('dataExistsInBatch-->'+dataExists);
        if(scope.size()>0){
             DeactivationBatchHandler.determinesObjectTypeHandler(scope);
        }
       
    }
 
    //Method to be called after the excute
    global void finish(Database.BatchableContext bc){
        //Add your start code for the other batch job here
       // Database.executeBatch(new Batch2());
    }
}