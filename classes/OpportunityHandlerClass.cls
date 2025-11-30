public class OpportunityHandlerClass {
    public static void validateAmmount(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount == null){
                opp.addError('please populate Ammount on Opportunity');
            }
        }
    }

    
    
public static void updateDesc(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
        List<Opportunity> oppListToBeUpdated = new List<Opportunity>();
    
         for(Opportunity opp : oppList){
         Opportunity o = new Opportunity();
             o.Id=opp.Id;

          if(opp.StageName != oldMap.get(opp.Id).StageName){
               if(opp.StageName == 'Closed Won'){
                   o.Description= 'Opportunity is closed Won';
                       }

                else if(opp.StageName == 'Closed Lost'){
                   o.Description = 'Opportunity is closed Lost';
                   } //1 we can write here for not responding on every update
             }
                 oppListToBeUpdated.add(o); //1

        }

        if(!OppListToBeUpdated.isEmpty()){
         update oppListToBeUpdated;

        }

    }
    
  
    public static void UpdateNewAnnualRevIfUDU(List<Opportunity> oppList){
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        
        for(Opportunity opp : oppList){
            if(opp.AccountId != null){
                accIds.add(opp.AccountId);
            }
        }
        
 
        
        for(Account acc : [SELECT Id,AnnualRevenue, (SELECT Id, Amount FROM Opportunities) FROM Account WHERE Id IN: accIds]){
                   
            Decimal totalRevenue =0;
            
            for( Opportunity opp : acc.Opportunities){
                if(opp.Amount != null){
                    totalRevenue += opp.Amount;
                }

            }
            
                acc.AnnualRevenue= totalRevenue;
                accList.add(acc); 
        }
     
        if(!accList.isEmpty()){
            update accList;
        }
        
    }
    
    
    
    public static void PreventOppDeletion(List<opportunity> oppList){
        
        for(Opportunity opp: oppList){
            if((opp.StageName != 'Closed Won') || ( opp.StageName != 'Closed Lost')){
                opp.addError('Opp must be closed');
            }
        }
    }
    


    

    

    public static void UpdateDescbasedOnStage(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
        
        For(Opportunity opp : oppList){
            if(oldMap == null || opp.StageName != oldMap.get(opp.AccountId).StageName ){
                if(opp.StageName== 'Closed Won'){
                    opp.Description='Opportunity is Closed Won';
                }
                else if(opp.StageName=='Closed Lost'){
                    opp.Description='Opportunity is Closed Lost';
                }
                else{
                    opp.Description='Opportunity is open';
                }
            }
              
        }
        
    }
   
    
   
    public static void UpdateDescbasedOnAmt(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount != null && opp.Amount >= 100000){
                opp.Description='Hot Opportunity';
                
            }
        }
    }
    
    
    
    public static void populateLetestOppAmtOnAcc(List<Opportunity> oppList){
        List<Account> accList = new List<Account>();
        
        for(Opportunity opp: oppList){
            if(opp.AccountId != Null && opp.AccountId != null){   
                Account  acc = new Account();
                acc.Id=opp.AccountId;
                acc.Recent_Opportunity_Amount__c=opp.Amount;
                
                accList.add(acc);
            }}
        if(!accList.isEmpty()){
                update accList; }
        }
        
    
    
    
    
}