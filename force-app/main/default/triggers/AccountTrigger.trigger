trigger AccountTrigger on Account (before insert, after insert, before update, after update, before Delete) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.updateDesc(Trigger.New);
            AccountTriggerHandler.PopulateRating(Trigger.New, null);
            AccountTriggerHandler.CopyBillingAddToShip(Trigger.New, null);
            //  AccountTriggerHandler.updateRating(Trigger.New);    
        }
        else if(Trigger.isAfter){
            // AccountTriggerHandler.CreateOpp(Trigger.New);
            //  AccountTriggerHandler.createConWhenAccIsCreated(Trigger.New);
            AccountTriggerHandler.CreateContactOrOpp(Trigger.New);
          Boolean b=  AccountTriggerHandler.handaleAccount(Trigger.New);
            //In after insert trigger.new is read only
        }
    }
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerHandler.updatePhone(Trigger.New, Trigger.oldMap);
            AccountTriggerHandler.PopulateRating(Trigger.New, Trigger.oldMap);
             AccountTriggerHandler.CopyBillingAddToShip(Trigger.New, Trigger.oldMap);
            
        }
        else if(Trigger.isAfter){
              AccountTriggerHandler.updateRelatedContact(Trigger.New, Trigger.oldMap);
              AccountTriggerHandler.updateRelatedContactMalingAcc(Trigger.New, Trigger.oldMap);
             AccountTriggerHandler.updateRelatedOpportunityStage(Trigger.New, Trigger.oldMap);
            if(!PreventRecursion.firstCall){
                PreventRecursion.firstCall= true;
             AccountTriggerHandler.updateAccount(Trigger.New, Trigger.oldMap);
            }
      
      
        }
    }
    if(Trigger.isDelete){
        if(Trigger.isBefore){
             AccountTriggerHandler.preventDeletion(Trigger.old);
         
            
        }
        else if(Trigger.isAfter){
            
            
            
        }
    }
    
    
}