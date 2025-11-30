@istest
public class OpportunityTriggerHandelerTest {
    @isTest
    public static void updateDescTest(){
        //create data
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=1;i<=5;i++){
            Opportunity opp= new Opportunity();
            opp.Name='TestOpp'+i;
            opp.StageName='Prospecting';
            opp.CloseDate=system.today();
            opp.Amount=200000;
            oppList.add(opp);
        }
        Test.StartTest();
        insert oppList;
        Test.StopTest();
        
        List<Opportunity> updatedOppList= [SELECT Id, Description FROM Opportunity WHERE Id=: oppList[0].Id];
        System.assertEquals('Hot Opportunity', updatedOppList[0].Description);
    }
   

}