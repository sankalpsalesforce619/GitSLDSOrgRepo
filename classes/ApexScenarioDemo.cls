public class ApexScenarioDemo {
     public static void ApexscenarioPractice3(){ // Create a lookup to employee on a contact object query contact created last week 
                                                 // and if mobile phone is not populated on contact then copy a phone or un related employee
      List<Contact> conList = [SELECT ID, Phone, Employee__r.Phone__c  FROM Contact WHERE CreatedDate= LAST_WEEK];
         if(!conList.isEmpty()){
             for(Contact con : conList){
                 if(con.Phone == null ){
                     con.Phone=con.Employee__r.Phone__c;
                 }
              
                 
           
             }
             Upsert conList;
         }
         
     }
    public static void ApexscenarioPractice2(){ // Query employee created this year and if phone is not populated on an employee record 
                                                // then copy of phone of a related account (child parent soql)
         List<Employee__c> empList = [SELECT Id, Name__c ,Phone__c, Account__r.Phone FROM Employee__c WHERE CreatedDate = THIS_YEAR];
        if(!empList.isEmpty()){
            for(Employee__c emp : empList){
                if(emp.Phone__c == null){
                    emp.Phone__c=emp.Account__r.Phone;
                }
            }
            update empList;
        }
    
    }
    
    
    public static void ApexscenarioPractice1(){  // Create custom object named employee creates name salary phone lookup account field on an 
        //employee object create a total salary field on account now query account created this year along with unrelated employee populated
        // total salary of all account employees on the account parent child SOQL
        List<Account> accList = [SELECT Id, Name, Total_Salary__c,(SELECT Id, Salary__c FROM Employees__r) FROM Account WHERE CreatedDate= THIS_YEAR];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                Decimal total=0;
                for(Employee__c emp : acc.Employees__r){
                    total= total+emp.Salary__c;
                }
               acc.Total_Salary__c=total;
                
            }
            update accList;
        }
    }
    
    
    
     public static void Apexscenario5(){
         list<Contact> conList = [SELECT Id, MobilePhone, Account.Phone FROM Contact WHERE CreatedDate= THIS_YEAR];
         if(!conList.isEmpty()){
             for(Contact con : conList){
                 if(con.MobilePhone ==  null && con.Account.Phone !=null){
                     con.mobilePhone=con.Account.Phone;
                 }
                 
             }
             update conList;
         }
         
     }
    
    public static void Apexscenario4(){
        
        List<Account> accList = [SELECT Id,Total_Contact_Count__c, Active__c, (SELECT Id FROM Contacts) FROM Account WHERE CreatedDate= THIS_YEAR];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Total_Contact_Count__c=acc.Contacts.size();
                if(acc.Active__c == null){
                    acc.Active__c='Yes';
                }
                }
             update accList;
        }
        
        
    }
    public static void Apexscenario3(){
        List<Opportunity> oppList = [SELECT Id, StageName FROM Opportunity WHERE Createddate = THIS_YEAR];
        
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                if(opp.StageName == 'Closed Won'){
                    opp.Description='Opportunity is Closed Won' ;
                }
                else if (opp.StageName=='Closed Lost'){
                    opp.Description='Opportunity is Closed Lost';
                }
                else{
                    opp.Description='Opportunity is Open';
                }
            }
            update oppList;
            
        }
        
    }
        
    public static void Apexscenario2(){
       // if(!accList.isEmpty())
            for(Account acc: [SELECT Id, Name, (SELECT Id, Amount FROM Opportunities) FROM Account WHERE Phone != null])
            {
                Decimal total= 0;
                for (Opportunity opp : acc.Opportunities){
                    if(opp.Amount!=Null){
                    total= total+opp.Amount;
                    }}
                  System.debug(acc.Name + ' Has '+ total +'Worth Opportunity');
                
            }
        }
           
        
        
        
    
    
    
   
    
    public static void apexSenario1(){
        List<Account> accList= new List<Account>();
        accList= [SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account WHERE Phone!=null];
     
        if(!accList.isEmpty()){
            for(Account acc : accList){
                System.debug(acc.Name + ' has ' + acc.Contacts.size()+ ' Contacts Related');
            }
        }
        
    }

}