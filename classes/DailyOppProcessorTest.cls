@isTest 
public class DailyOppProcessorTest {
     
     @isTest
    private static void testScheduleableApex(){
         String sch = '0 0 0 ? * * *';
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=0; i<500; i++){
            if(i<250){
                oppList.add(new Opportunity  (Name='Test'+i,Amount= 0, StageName= 'Prospecting', CloseDate=system.today()));
            }
            else{
                 oppList.add(new Opportunity  (Name='Test'+i,Amount=0, StageName= 'Prospecting', CloseDate=system.today(), LeadSource = 'Email'));
            }
        }
        insert oppList;
        Test.StartTest();
        String JobId= System.schedule('Process Opp', sch, new DailyOppOeocessor());
        Test.StopTest();
        
        List<Opportunity> UpdateOpps = new List<Opportunity>();
        updateOpps= [SELECT Id, LeadSource FROM Opportunity WHERE LeadSource = 'Web'];
       
        System.assertEquals(200,UpdateOpps.size());
    }
}