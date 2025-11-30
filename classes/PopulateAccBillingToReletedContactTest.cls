@isTest
public class PopulateAccBillingToReletedContactTest {
    @isTest
    private static void BatchTest(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<200;i++){
            Account acc = new Account();
            acc.Name='test'+i;
            acc.Active__c='Yes';
            acc.BillingCity='testcity';
            acc.BillingCountry='TestCountry';
            acc.BillingPostalCode='testpin';
            acc.BillingState='testState';
            acc.BillingStreet='testStreet';
            accList.add(acc);
        }
        Test.StartTest();
      PopulateAccBillingToReletedContact PopulateAccBillingToReletedContact = new PopulateAccBillingToReletedContact();
         Id batchId = Database.executeBatch(PopulateAccBillingToReletedContact,200);
        Test.StopTest();
        
        List<Contact> updatedCon =[SELECT Id, MailingCountry FROM Contact WHERE MailingCountry='testcity'];
      
    }

}