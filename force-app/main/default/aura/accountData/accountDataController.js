({
	doInit : function(component, event, helper) {
		var action= component.get("c.getAccounts");
        action.setCallback(this, function(response){ var State = response.getState();
            if(State==="SUCCESS"){ component.set("v.accList", response.getReturnValue()); }
                           });
        $A.enqueueAction(action);
	}
})