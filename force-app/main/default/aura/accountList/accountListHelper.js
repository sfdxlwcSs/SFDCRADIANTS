/**
 * @File Name          : accountListHelper.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 22/5/2020, 3:57:21 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    22/5/2020   Somnath Sharma     Initial Version
**/
({
	hasFile : function(component, event, helper) {
		var action = component.get('c.getAccList'); 
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
				component.set('v.accList', a.getReturnValue());
				console.log('accData'+JSON. stringify(a.getReturnValue()));
            }
        });
        $A.enqueueAction(action);
	}
})