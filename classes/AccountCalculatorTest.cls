@isTest
public class AccountCalculatorTest {
    
    @isTest
    Private static void contContactsTest(){
        List<Account> accList = new List<Account>();
        
        For(Integer i=0; i<=250; i++){
            accList.add(new Account(Name='Test'+i, Active__c='Yes'));
        }
        
        Test.StartTest();
        insert accList;
        
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = New List<Id>();
        for(Account acc :accList){
            Contact con = new Contact();
            con.FirstName = 'Test';
            con.LastName = acc.Name;
            con.AccountId=acc.Id;
            conList.add(con);
            accIds.add(acc.Id);
        }
        
        insert conList;
        AccountCalculator.contactCount(accIds);
         Test.StopTest();
        List<Account> accs=[SELECT Id, Count_Number_of_Contacts__c FROM Account];
        System.assertEquals(1, accs[0].Count_Number_of_Contacts__c, 'Contact is not counted sucessfully');
       
    }

}