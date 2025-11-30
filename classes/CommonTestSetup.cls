@isTest
public class CommonTestSetup {
    
    @testSetup
 static void setup(){
        //create coomon test Account 
        List<Account> testAccts = new List<Account>();
        for(Integer i=0; i<2; i++){
           testAccts.add(new Account(Name = 'TestAcct'+i));
        
    }
    insert testAccts;

    }

 @isTest
    static void testMethod1(){
        Account acct =[SELECT Id FROM Account WHERE Name = 'TestAcct0' LIMIT 1]; // Get the first test account by using a sql query
        acct.Phone='555-11122';    // Modify first account
        update acct;               // This update is local to this test method only
        
        Account acct2 = [SELECT Id FROM Account WHERE Name='TestAcct1' LIMIT 1];  // Delete second account
        
        delete acct2;
         
    }

 @isTest
    static void testMethod2(){
        Account acct =[ SELECT Phone FROM Account WHERE Name='TestAcct0' LIMIT 1]; // The changes made by a testmethod1 rollback() and are not Visible to this test method
                                                                                     // Get the first account by using a SOQL query
        System.assertEquals(null, acct.Phone);       // Verify that the test account created by test setup method is Unaltered                              
        
        Account acct2=[SELECT Id FROM Account WHERE Name='TestAcct1' LIMIT 1]; // Get the second account by using a SOQL query
        System.assertNotEquals(null, acct2);                               // Verify test account created by test setup method is unaltered.
        
    }
    
}