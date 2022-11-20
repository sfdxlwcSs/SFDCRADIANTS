({
	  getData : function(component,event){
       
       
        var action = component.get('c.getLongTextFieldData');//Call server side method to get records for the data table
              action.setParams({
            accId:component.get("v.recordId")

        });
          action.setCallback(this,function(response){
            var state = response.getState();
            if(state == 'SUCCESS'){
                var records = JSON.parse(response.getReturnValue().test_long__c);
                debugger;
                //renderApplicationData
                if(records.result.applicationsFound>0 ){
                 component.set('v.mycolumns', [
                {label: 'loanId', fieldName: 'loanId', type: 'text'},
                     {label: 'creationDate', fieldName: 'creationDate', type: 'date',timeZone:"UTC"},
                {label: 'applicationStatus', fieldName: 'applicationStatus', type: 'text'},
                {label: 'stageName', fieldName: 'stageName', type: 'text '},
                {label: 'sourceName', fieldName: 'sourceName', type: 'text '}    
            ]);  
                    var d = new Date();
                   records.result.applications.forEach(ele=>{
                     ele.creationDate=  d; 
                    });
                 component.set('v.appdata',records.result.applications);
                    component.set("v.renderApplicationData",true);
                }
                
            }
        });
        $A.enqueueAction(action);
    },
})