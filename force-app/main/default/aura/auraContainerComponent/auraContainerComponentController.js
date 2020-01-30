({
    handleFlowLaunch : function(component, event, helper) {
        //the enclosing Aura component can capture the event and handle it.
        /**
         * The Aura component’s controller receives the event. You can handle the event however you’d like. This component operates on the
         *  eventParams array passed 
         * in the details property of the Lightning web component event.
         */
        var eventData = event.getParam('eventParams');
        component.set("v.showModal",eventData.showFlow);
        var inputVariables = [];
        if(eventData.showFlow){
            var flow = component.find("flow");
            flow.startFlow("CreateAccLwc", inputVariables);
        }
    },
    statusChange : function (cmp, event) {
        if (event.getParam('status') === "FINISHED") {
           
            var outputVariables = event.getParam("outputVariables");
            window.console.log('flow data',JSON.stringify(outputVariables) );
            for(var i = 0; i < outputVariables.length; i++) {
               var outputVar = outputVariables[i];
                if(outputVar.name === "accInfoCreated") {
                
                  var toastEvent = $A.get("e.force:showToast");
                  toastEvent.setParams({
                      "title": "Success!",
                      "message":outputVar.value.Name+"-Account Record Created Successfully",
                      "type":"success"
                  });
                  toastEvent.fire();
            }
        }
        }
      }
})