({
	doInit: function(cmp, event, helper) {
		var navService = cmp.find("navService");
		
 var pageReference = {
			type: "standard__recordRelationshipPage",
			attributes: {
				recordId: '0012v00003EfkvxAAB',//id of account
				objectApiName: "Contact",
				relationshipApiName: "Contacts",
				actionName: "view"
			}
		};
        navService.navigate(pageReference);
		//$A.get("e.force:closeQuickAction").fire();
	}
});