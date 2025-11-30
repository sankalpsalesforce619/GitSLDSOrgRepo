@isTest
public class OppProcessorTest {
    @isTest
    Private static void testBatchClass(){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=0; i<200;i++){
            Opportunity opp = new Opportunity();
            opp.Name='Test'+i;
            opp.CloseDate=system.today();
            opp.StageName='Prospecting';
            opp.Amount=0;
            oppList.add(opp);
            
        }
        Test.StartTest();
        insert oppList;
        OppProcessor OppProcessor = new OppProcessor();
        Id batchId = Database.executeBatch(OppProcessor,200);
        Test.StopTest();

      List<Opportunity> updatedOpp = [SELECT Id FROM Opportunity WHERE LeadSource = 'Web'];
        System.assertEquals(200,updatedOpp.size());  //imp to find error
    }
}