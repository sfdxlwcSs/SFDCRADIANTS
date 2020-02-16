/**
 * @File Name          : BatchScheduler.cls
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 16/2/2020, 11:31:47 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    16/2/2020   Somnath Sharma     Initial Version
**/
global class BatchScheduler implements Schedulable {
    
    // Execute at regular intervals
    global void execute(SchedulableContext ctx){
      
        LeadBatchClass batch = new LeadBatchClass();
        Database.executebatch(batch, 200);
    }
}