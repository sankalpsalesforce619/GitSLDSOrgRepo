public class DailyOppOeocessor implements Schedulable{
    
    public void execute(SchedulableContext ctx){
        List<Opportunity> oppList = [SELECT Id, LeadSource FROM Opportunity WHERE LeadSource = Null LIMIT 200];
        
        for(Opportunity opp: oppList){
            opp.LeadSource= 'Web';

        }
        if(!oppList.isEmpty()){
            update OppList;
        }
    }

    
}