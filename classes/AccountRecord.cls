public class AccountRecord {
    
    public static ID insertAccount(String name, String rating, String active){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating= Rating;
        acc.Active__c= active;
        
        insert acc; // this statement will insert a record into the org.
        
        return acc.Id; // After creation of account record, It's Id will availabe in account
    }
    
    Public static void insertContact(){
        
        Id accId;
        accId = insertAccount('SGTC 1010','Hot','Yes');
        Contact con= new Contact (FirstName='Contact 101',LastName='Contact 201');
        con.accountId=accId; //account is lookup to account
        insert con;  
    }
    
    public static Void insertAccountWithConAndOpp(String name, String rating, String active){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating= Rating;
        acc.Active__c= active;
        
        insert acc; // this statement will insert a record into the org.
        
        Contact con= new Contact (FirstName='Contact 101',LastName='Contact 201');
        con.accountId=acc.Id; //account is lookup to account
        insert con;  
        
        Opportunity opp =new Opportunity();
        opp.Name = 'Opp 1010';
        opp.CloseDate= System.today();
        opp.StageName = 'prospecting';
        opp.AccountId = acc.Id;
        insert opp;
    }
    
    
    public static Void insertAccountWithConAndOppAndcase (String name, String rating, String active){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating= Rating;
        acc.Active__c= active;
        
        insert acc; // this statement will insert a record into the org.
        
        Contact con= new Contact (FirstName='Contact 101',LastName='Contact 201');
        con.accountId=acc.Id; //account is lookup to account
        insert con;  
        
        Opportunity opp =new Opportunity();
        opp.Name = 'Opp 101';
        opp.CloseDate= System.today();
        opp.StageName = 'prospecting';
        opp.AccountId = acc.Id;
        insert opp;
        
        //case
        Case cs = new Case();
        cs.RecordTypeId= '012dM00000A1UvxQAF';
        cs.Status='Working';
        cs.Origin='Phone';
        opp.AccountId = acc.Id;
        insert cs;
    }
    
    
}

/* Account acc = new Account();
acc.Name = 'SLTC 08';
acc.Rating= 'Hot';
acc.Active__c= 'Yes';

insert acc; // this statement will insert a record into the org.


AccountRecord.insertAccountWithConAndOpp('SGTS 208','Hot','Yes');

*/