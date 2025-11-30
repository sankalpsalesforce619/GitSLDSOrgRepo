public class DMLDemo {
    
    public static void databaseClassDemo(){
        
        List<Contact> conList = new List<Contact>{
        new Contact (FirstName='Joe',LastName='Smith',Department='Finance'),
        new Contact (FirstName='kethy',LastName='Smith', Department= 'Technology'),
        new Contact (FirstName='caroline',LastName='Roth', Department='Finance'),
            new Contact()};
              
      Database.SaveResult[] srList = Database.insert(conList,false);
        
        //Iterate through each returned result
        for(Database.SaveResult sr : srList) {
            if (sr.isSuccess()){
            // Operation was successful, so get the id of the record that was Processed
            System.debug('Sucessfully inserted contact. Contact Id:'+ sr.getId());
            } 
            else {
                // Operation failed, so get all errors
                for(Database.Error err : sr.getErrors()){
                    System.debug('The following error Has occurred.');
                    System.debug(err.getStatusCode() + ':' + err.getMessage());
                    System.debug('Contact field that affected this error'+ err.getFields());
                }
            }
            
        }
                
    }
    
    
    
    
    
    
    
    public static void DeleteDemo(){
        List<Account> accList = new List<Account>();
        accList=[SELECT Id, Name FROM Account WHERE Name LIKE 'Test DML %' ALL ROWS]; //ALL ROWS will search a record in recycle bin as well
        
        /*   if(!accList.isEmpty()){
delete accList;}
}
*/
        if(accList.size()>0){
            undelete accList;}}
    
    
    public static void UpSertDemo(){
        List<Account> accList = new List<Account>();
        accList=[SELECT Id, Name FROM Account WHERE Rating = 'Hot'];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Industry = 'Energy';
                acc.Active__c='Yes';
            }
              Update accList; 
            
            try{
                for(Integer i=1; i<=5; i++){
                    Account acc = new Account ();
                    // acc.Name='Test Upsert'+i;
                    acc.Active__c='Yes';
                    accList.add(acc);
                }
                if(!accList.isEmpty()){
                    Upsert accList;       
                }
                
            }
            
            catch(DMLException e){
                System.debug(e);
                
            }
            
            
        }
    }
    
    
    
    
    
    public static void UpdateDemo(){
        List<Account> accList = new List<Account>();
        accList=[SELECT Id, Name FROM Account WHERE Rating = 'Hot'];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Industry = 'Media';
                acc.Active__c='Yes';
            }
            
            update accList;
            
        }}
    
    
    
    
    public static void insertDemo(){
        
        List<Account> accList = new List<Account>();
        //    List<Contact> conList = new List<Contact>();
        
        for(Integer i=1; i<=200; i++){
            Account acc = new Account ();
            acc.Name='Test DML'+i;
            acc.Active__c='Yes';
            accList.add(acc);
        }
        insert accList;
        
        
   /*  Account acc = new Account ();
acc.Name='Test DML 110';
acc.Active__c='Yes';
accList.add(acc); //DML 1

Account acc1 = new Account ();
acc1.Name='Test DML 111';
acc1.Active__c='Yes';
accList.add(acc1); //DML2

insert accList;


Contact con = new Contact();
con.FirstName= acc.Name;
con.LastName = acc.Name;
con.AccountId =accList[0].Id;
conList.add(con);



Contact con1 = new Contact();
con1.FirstName=acc.Name;
con1.LastName=acc.Name;
con1.AccountId=accList[1].Id;
conList.add(con1);


insert ConList;
//  System.debug('account id ='+ acc.Id);*/
    }
    
}