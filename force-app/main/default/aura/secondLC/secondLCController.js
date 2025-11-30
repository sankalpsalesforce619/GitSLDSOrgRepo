({
	handelClick: function(component, event, helper) {
        //component.set("v.Message1","First Button Clicked");
         helper.helperMethod(component, event);
          
      
	},
    
    handelClick2: function(component, event, helper) {
       // var msg1= event.getSource().get("v.label")
      //  component.set("v.Message2",msg1);
       helper.helperMethod(component, event);
	}
})