@isTest
private class AccountTriggerHandelerTest  {
    
    public static testMethod void testRunAs() {
        // Setup test data
        // Create a unique UserName
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        // This code runs as the system user
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
         UserName=uniqueUserName);

        System.runAs(u) {
              // The following code runs as user 'u'
              System.debug('Current User: ' + UserInfo.getUserName());
              System.debug('Current Profile: ' + UserInfo.getProfileId());
          }
    }

   
    @testSetup
    static void setup(){
           List<Account> accList = new List<Account>();
             
        for(Integer i=1; i<=10; i++){
            Account acc = new Account();
            
            acc.Name='Test'+i;
            acc.Industry='Media';
            acc.Active__c='Yes';
            accList.add(acc);
        }
       
        Test.StartTest();
        insert accList;
        Test.StopTest(); 

        
    } 
    
  
    
    @isTest
    static void CreateOppTest(){
    
        List<Account> accList = new List<Account>();
            accList = DataFactory.createAccountRecord('Test',10, false);
        for(Account acc: accList){
            acc.Industry='Media';
        }
        insert accList;
   
        
        List<Opportunity> oppList = [SELECT Id
                                     FROM Opportunity
                                     WHERE AccountId =: accList[0].Id];
        
        System.assert(oppList != null, 'Opportunity is not created');
        
    }
  @isTest
    static void CreateConTest(){
    
        
        List<Account> accList = new List<Account>();
            accList=[SELECT Id, Name, Industry FROM Account];
        List<Contact> conList = [SELECT LastName FROM Contact WHERE AccountId =: accList[0].Id];
        
        System.assert(conList != null, 'conList');
        
    }

 @isTest
    static void PopulateRatingInsert(){
      
         List<Account> accList = new List<Account>();
             accList = [SELECT Id, Name, Active__c, Industry FROM Account];

     List<Account> updatedAccList =[SELECT Rating FROM Account WHERE Id =: accList[0].Id];
        
        System.assertEquals('Hot', updatedAccList[0].Rating);
        
    }
    
   @isTest
    static void PopulateRatingUpdate(){
         List<Account> accList = new List<Account>();
             
        for(Integer i=1; i<=10; i++){
            Account acc = new Account();
            
            acc.Name='Test'+i;
            acc.Active__c='Yes';
            acc.Industry='Banking';
            accList.add(acc);
        }
        Test.StartTest();
        insert accList;
        
        
        for(Account acc: accList){
            acc.Industry='Media';
        }
        
        update accList;
        Test.StopTest();
        
         List<Account> updatedAccList =[SELECT Rating
                                        FROM Account
                                        WHERE Id =: accList[0].Id];
          System.assertEquals('Hot', updatedAccList[0].Rating);

    
    }
    /*
    


  @isTest
    static void copyBillingToShippingTest(){
         //create sample data
        List<Account> accList = new List<Account>();
        
        for(Integer i=1;i<=5;i++){
            Account acc= new Account();
            acc.Name='Test'+i;
          acc.BillingCity='testCity';
            acc.BillingCountry='TestCountry';
            acc.BillingPostalCode= '1234' ;
            acc.BillingState='TestState';
            acc.BillingStreet='testStreet';
            acc.CopyBillingToShipping__c= true;
            accList.add(acc);
        }
        
          //Insert data
           Test.StartTest();
           insert accList;
           Test.StopTest();
        
        List<Account> updatedAccList = [SELECT Id, ShippingCity FROM Account
                                        WHERE Id =: accList[0].Id];
        
        System.assertEquals('testCity', updatedAccList[0].ShippingCity);

        
    }    
    
 
     @isTest
    static void updateDescTest(){
        //create sample data
        List<Account> accList = new List<Account>();
        
        for(Integer i=1;i<=5;i++){
            Account acc= new Account();
            acc.Name='Test'+i;
            acc.Industry='Energy';
            accList.add(acc);
        }
        
          //Insert data
           Test.StartTest();
           insert accList;
           Test.StopTest();

          
       List<Account> updatedAccList =[ SELECT Id, Rating FROM Account WHERE Id=: accList[0].Id];
        //apply assert condition
       system.assertEquals('Hot',updatedAccList[0].Rating);

    }*/
}