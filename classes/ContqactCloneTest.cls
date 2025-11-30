@isTest 
public class ContqactCloneTest {
    @TestSetup
    static void testsetup(){
        List<Account> accList = new List<Account>();
        for(Integer i=1; i<=5; i++){
            Account acc= new Account();
            acc.Name= 'Queue'+i;
            acc.Industry='Media';
            acc.Active__c='Yes';
            accList.add(acc);
    }
    insert accList;
    }
    @isTest
    public static void textContactClone(){
        Contact con = new Contact(LastName='Queueabel');
        string industryValue='Media';
        ContactClone job = new ContactClone(con, 'Media');
        
        Test.startTest();
        ContactClone conClone = new ContactClone(con,industryValue);
        System.enqueueJob(conClone);
        test.stopTest();
        System.assertEquals(5,[SELECT Count() FROM Contact WHERE AccountId IN (SELECT Id FROM Account WHERE Industry = 'Media')]);
    }          
    
    }