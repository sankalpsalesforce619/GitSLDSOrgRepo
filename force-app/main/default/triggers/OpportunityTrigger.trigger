trigger OpportunityTrigger on Opportunity (before insert, After insert,Before Update, After Update, before Delete, After Delete,After Undelete) {

    if(Trigger.isInsert){
        if(Trigger.isBefore){
             OpportunityHandlerClass.UpdateDescbasedOnAmt(Trigger.New);
             OpportunityHandlerClass.UpdateDescbasedOnStage(Trigger.New, null);
             OpportunityHandlerClass.validateAmmount(Trigger.New);
            
            
        }
        if(Trigger.isAfter){
              OpportunityHandlerClass.populateLetestOppAmtOnAcc(Trigger.New);
              OpportunityHandlerClass.UpdateNewAnnualRevIfUDU(Trigger.New);
        } 
    }
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
       //  OpportunityHandlerClass.UpdateDescbasedOnStage(Trigger.New,Trigger.oldMap);  
            
        }
        if(trigger.isAfter){
              OpportunityHandlerClass.UpdateNewAnnualRevIfUDU(Trigger.old);
             
             if(!PreventRecursion.firstCall){
                PreventRecursion.firstCall= true;
            OpportunityHandlerClass.updateDesc(Trigger.New,Trigger.oldMap);
            }
      
              
            
        }
    }
    
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            OpportunityHandlerClass.PreventOppDeletion(Trigger.old);
        }
        
        if(trigger.isAfter){
              OpportunityHandlerClass.UpdateNewAnnualRevIfUDU(Trigger.old);
        }
    }
    
    if(Trigger.isUndelete){
        
        if(trigger.isAfter){
              OpportunityHandlerClass.UpdateNewAnnualRevIfUDU(Trigger.New);
        }
    }
       
    
}