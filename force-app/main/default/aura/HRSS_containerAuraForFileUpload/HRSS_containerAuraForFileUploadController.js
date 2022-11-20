({
    handleFlowLaunch: function(component, event, helper) {
        //the enclosing Aura component can capture the event and handle it.
        /**
         * The Aura component’s controller receives the event. You can handle the event however you’d like. This component operates on the
         *  eventParams array passed 
         * in the details property of the Lightning web component event.
         */
        var eventData = event.getParam('eventParams');
        var inputVariables = [];
        var flow = component.find("fileuploadflow");
        component.set("v.caseId", eventData.caseId);

        inputVariables.push({ name: "sObjectId", type: "String", value: eventData.caseId });
        // inputVariables.push({ name: "sobjectname", type: "String", value: eventData.sobjectname });
        flow.startFlow("HRSS_File_Upload_Flow", inputVariables); //API name of Flow
        component.set("v.hideCmp", eventData.hideCmp);

    },
    statusChange: function(cmp, event) {
        if (event.getParam('status') === "FINISHED") {

            var navEvt = $A.get("e.force:navigateToSObject");
            navEvt.setParams({
                "recordId": cmp.get("v.caseId"),
                "slideDevName": "related"
            });
            navEvt.fire();
        }


    }
})