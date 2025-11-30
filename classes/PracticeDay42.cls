public class PracticeDay42 {
    
    public static void AccUpdate7Days(){
        
        List<Account> accList= [SELECT Id, Name, Phone FROM Account WHERE Phone != null AND createdDate = LAST_N_DAYS:7];
        if(accList.size()>0){
            for(Integer i= 0; i<accList.size();i++){
                Account acc= accList.get(i);
                acc.Phone='123456789';
                
               
}
            
            Update accList;
        }}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    Public static void ACCINSERT(){ 
         List<Opportunity> oppList =new List<Opportunity> ();
           List<Account> accList= [SELECT Id, Name FROM Account WHERE CreatedDate = LAST_WEEK];
        if(accList.Size()>0){
             Integer l = accList.Size();
               for(Integer i=1;i<=l;i++){
                   integer index=i-1;
                   Opportunity opp =new Opportunity();
                   opp.Name='Test acc to Opp '+i;
                   opp.CloseDate=Date.today();
                   opp.StageName='Qualification';
                   opp.AccountId=accList[index].Id;
                   oppList.add(opp);}
            
                    if(!oppList.isEmpty()){
                   insert oppList;
                    }
            
        }
    }
        
    
    Public static void oppDelete(){
        
        List<Opportunity> oppList =[SELECT Id , Name, CreatedDate, StageName  FROM Opportunity 
                                    WHERE StageName = 'Closed Lost' AND CreatedDate = LAST_MONTH];
        if(!oppList.isEmpty()){
                delete oppList;
            }
        
    }
    
    public static void DeleteAcc (){
        List<Account> accList= [SELECT Id, Name FROM Account WHERE Name LIKE 'New upsert rahul%'];
            if(!accList.isEmpty()){
                delete accList;
            }
            }
    
    //test leter
    
    public static void UpsertAcc(){
        List<Account> accList= [SELECT Id, Name, Phone FROM Account WHERE Phone LIKE '(222) 757-6002'];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Phone='(333) 757-6002';
            } }
             UpDate accList;
        try{
           for(Integer i=1;i<=5;i++){
               Account acc = new Account();
               acc.Name='Akash'+i;
               acc.Active__c= 'Yes';
               acc.Phone= '8888777722'+i;
               accList.add(acc);
           }
           
           if(!accList.isEmpty()){
               upsert accList;}
           
        }
        Catch(DMLException e){
            system.debug(e);
        }
    }
           
           
           
           public static void updateContact(){
               List<Contact> conList= [SELECT Id, Name, Email FROM Contact WHERE Email = Null];
               
               if(!conList.isEmpty()){
                   for(Contact con: conList){
                       con.Email='test@test.com';
                       
                   }
                   Update conList;
               }
           }
           
           
           
           
           
           
           
           public static void updateAcc(){
               List<Account> accList= [SELECT Id, Name, Phone FROM Account WHERE Phone LIKE '(512) 757-6000'];
               
               if(!accList.isEmpty()){
                   for(Account acc: accList){
                       acc.Phone='(111) 757-6002';
                       
                   }
                   Update accList;
               }
           }
           
           
           
           
           
           
           Public static void InsertAccOpp(){
               
               List<Account> accList = new List<Account>();
               List<Opportunity> oppList = new list<Opportunity>();
               
               for(Integer i=1;i<=5;i++){
                   Account acc =new Account();
                   acc.Name='Sankalp '+i;
                   acc.Active__c='Yes';
                   accList.add(acc);
               }
               
               insert accList;
               
               for(Integer i=1;i<=5;i++){
                   integer index=i-1;
                   Opportunity opp =new Opportunity();
                   opp.Name='Sankalp '+i;
                   opp.CloseDate=Date.today();
                   opp.StageName='Qualification';
                   opp.AccountId=accList[index].Id;
                   oppList.add(opp);
                   
                   
                   
               }
               insert oppList;
               
               
               
               
               
               
           }
           
           Public static void InsertAccConOpp(){
               List<Account> accList = new List<Account>();
               List<Contact> conList = new List<Contact>();
               List<Opportunity> oppList = new list<Opportunity>();
               
               for(Integer i=1; i<=5 ;i++){
                   Account acc = new Account();
                   Acc.Name=' Acc With Con'+i+i;
                   Acc.Active__c='Yes';
                   accList.add(acc);
               }
               insert accList;
               
               for(Integer i=1; i<=5 ;i++){
                   Integer index = i-1;
                   Contact con = new Contact();
                   con.FirstName='AccConOpp'+i+i;
                   con.LastName='Ramgsong';
                   con.AccountId=accList[index].Id;
                   conList.add(con);
               }
               insert conList;
               
               
               for(Integer i=1; i<=5 ;i++){
                   Opportunity opp = new Opportunity();
                   Integer index = i-1;
                   opp.Name='SFPD1';
                   opp.StageName='Closed Won';
                   opp.CloseDate=Date.Today();
                   opp.AccountId=accList[index].Id;  
                   oppList.add(opp);
                   
               }
               insert oppList;    
           }
           
           
           
           public static void InsertAccWithCon(){
               List<Account> accList = new List<Account>();
               List<Contact> conList = new List<Contact>();
               
               for(Integer i=1000; i<=1005; i++){
                   Account acc = new Account();
                   Acc.Name=' Acc With Con i'+i;
                   Acc.Active__c='Yes';
                   accList.add(acc);
                   
               }
               
               insert accList;
               for(Integer i=0; i<=5; i++){
                   Contact con = new Contact();
                   con.FirstName=' sas Acc related Con i'+i;
                   con.LastName='Developer'+i;
                   
                   con.AccountId=accList[i].Id;
                   conList.add(con);
               }
               insert conList;
               
               
               
               
           }
           
           
           
           public static void InsertOpp(){
               
               List<Opportunity> oppList=new List<Opportunity>();
               
               for(Integer i=101;i<=105;i++){
                   Opportunity opp = new Opportunity();
                   opp.Name='Test Insert oppoetunity '+ i;
                   opp.CloseDate= Date.Today();
                   opp.StageName='Prospecting';
                   oppList.add(opp);
               }
               insert oppList;
               
           }
           
           
           
           public static void InsertAcc(){
               
               List<Account> accList =new List<Account>();
               
               for(Integer i=101;i<=1055;i++){
                   Account acc = new Account();
                   acc.Name='Test insert'+i;
                   acc.Active__c= 'Yes';
                   acc.Phone= '77784892'+i;
                   accList.add(acc);
               }
               insert acclist;
           }
           
           }