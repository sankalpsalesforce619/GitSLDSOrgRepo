trigger PositionTrigger on Position__c (before insert,after Insert) {
    
   if(Trigger.isBefore){
           PositionTriggerHandler.populateData(Trigger.New); 
           
              
        }
    else if(Trigger.isAfter){
            PositionTriggerHandler.createTask(Trigger.New);
        }
}