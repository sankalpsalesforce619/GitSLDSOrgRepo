@isTest 
public class UpdateParentAccountTest {
 @TestSetup
    static void setup(){
        List<Account> accList =new List<Account>();
        accList.add(new Account (Name='Parent', Active__c='Yes'));
        
       
            for(Integer i=0; i<100;i++){
                accList.add(new Account (name='Test Account'+i, Active__c='Yes'));
            }
            insert accList;
        }      
        
        @isTest
        Private static void testQueueable(){
            Id parentId = [SELECT Id FROM Account WHERE Name='Parent'][0].id;
            
            List<Account> accList = [SELECT Id, Name FROM Account WHERE Name Like 'Test Account%'];
       
        
         UpdateParentAccount updatejob = new UpdateParentAccount(accList, parentId);
            
         Test.StartTest();
        System.enqueueJob(updatejob);
        Test.StopTest();
        
        System.assertEquals(100, [SELECT count() FROM Account WHERE parentId =: parentId]);
        }
}