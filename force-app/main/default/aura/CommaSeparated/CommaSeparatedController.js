({
	doInit : function(component,event,helper){
        //helper.getData(component,event,helper);
    },
    
    handleRowAction: function(component,event,helper){
         alert(event.getSource().get("v.name")); 
    },
})