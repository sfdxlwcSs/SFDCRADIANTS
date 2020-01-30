({
  doInit : function(component, event, helper) {
    var action = component.get("c.getProfileInfo");
    action.setCallback(this, function(response) {
      var state = response.getState();
      if(state == "SUCCESS" && component.isValid()){
        console.log("success") ;
        var result = response.getReturnValue();
        console.log(result.Name);
        component.set("v.profileName", result);
 
   }else{
     console.error("fail:" + response.getError()[0].message); 
    }
   });
  $A.enqueueAction(action);
}
})