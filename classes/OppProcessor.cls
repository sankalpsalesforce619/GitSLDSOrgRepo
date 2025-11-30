public class OppProcessor implements Database.Batchable<sObject>, Database.stateful{ // If you want to Convert your apex class into batchs 
                                                                                      //then you need to write Database.Batchable<sObject> 
 public integer recordCount =0;
    
    public Database.QueryLocator start(Database.batchableContext bc){
        return Database.getQueryLocator([SELECT Id, LeadSource FROM Opportunity]);
    }
    
    public void execute(Database.BatchableContext bc, List<Opportunity> opps){
        if(!opps.isEmpty()){
            for( Opportunity opp: opps){
                opp.LeadSource = 'Web';
            }
            
            update opps;
            recordCount = recordCount + opps.size();         //Database.satefull it wont allow recordCount to go to 0
        }
    }
    
    public void finish(Database.BatchableContext bc){
        system.debug('Total Records Processed'+ recordCount);
    }

}  /*Debug   
  OppProcessor OppProcessor = new OppProcessor();
 Id batchId = Database.executeBatch(OppProcessor,50); */ // 50 is batch size