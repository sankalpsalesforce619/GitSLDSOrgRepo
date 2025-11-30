({
	helperMethod : function(component, event) {
		 var msg= event.getSource().get("v.label")
          if(msg=="First Button"){
               component.set("v.Message1",msg);
          }else{
              component.set("v.Message2",msg);
          }
	}
})