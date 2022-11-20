({
	doInit : function(component, event, helper) {
   var currCode = $A.get("$Locale.currencyCode");
        component.set("v.ltngCurrencyCode",currCode);
},
})