public class SOQLDemo {
    
    
    public static Void childToPerentSOQLQuery(){
     List<Contact> conList =  [SELECT Id, FirstName, Account.Industry FROM Contact ];
        
        for (Contact con : conList){
            System.debug(con);
        }
        
    }
    
    
       
    public static Void childToPerentCosSOQLQuery(){
     List<Job_application__c> jaList =  [SELECT Name, Id, Position__r.Name FROM Job_application__c ];
        
        for (Job_application__c ja : jaList){
            System.debug(ja);
        }
        
    }
    
    
    
    
    
    
    
    
    
    public static void parentToChildCustomDemo(){
        // The relationship name should be 'Job_applications__r' if 'Job_applications' 
        // is the specified Child Relationship Name, but often the correct form
        // for SOQL is just the 'Child Relationship Name'. Let's use the explicit
        // relationship name provided: Job_applications
        List<Position__c> posList = [ SELECT Id, Name, 
                                     (SELECT Id, Name FROM Job_applications__r) 
                                     FROM Position__c ];
        
        for(Position__c pos : posList){
            System.debug('Position name NAME = ' + pos.Name);
            
            // Use the correct Child Relationship Name 'Job_applications' 
            // as the relationship field on the parent object.
            for(Job_application__c ja : pos.Job_applications__r){
                System.debug('Job_application = ' + ja.Name);
            }
        }
    }
    
    /*
public static void parentToChildCustomDemoclc(){
List<Class__c> clsList  =  [SELECT Id, Name,(SELECT Id, Name__c FROM Student__r) 
FROM Class__c];

for(Class__c cls : clsList){
System.debug('Class NAME =' + cls.Name);
for(Student__c stu : cls.Student__c){
System.debug('Student ='+ stu.Name__c);
}
}
}
*/
    /*
public static void parentToChildCustomDemo(){
List<Position__c> posList  =[SELECT Id, Name,(SELECT Id, Name FROM Job_application__r) 
FROM Position__c ];

for(Position__c pos : posList){
System.debug('Position name NAME =' +pos.Name);
for(Job_application__c ja : pos.Job_application__r)
System.debug('Job_application ='+ ja.Name  );
}
}
}
*/
    
    
    
    public static void LikeDemo(){ 
        String s = 'test';
        s='%'+s+'%';
        List<Account> acclist = [SELECT Id, Name FROM Account WHERE Name LIKE : s ];
        
        for(Account acc : acclist){
            System.debug(acc);
        }
        
    }
    
    
    
    public static void parentToChildDemo(){
        List<Account> accList  =[SELECT Id, Name,(SELECT Id, FirstName, LastName FROM Contacts) 
                                 FROM Account WHERE Rating ='Hot' ];
        
        for(Account acc : accList){
            System.debug('ACCOUNT NAME =' +acc.Name);
            for(Contact con : acc.Contacts){
                System.debug('Contact First Name ='+ con.FirstName + ' ' + 'Contact Last Name ='+ con.LastName );
            }
        }
    }
    
    
    public static Void aggDemo(){
        AggregateResult[] groupedResults = [SELECT Account.Name , Sum(Amount)
                                            FROM Opportunity 
                                            GROUP BY Account.Name];
        System.debug(groupedResults);
        for(AggregateResult ar :  groupedResults  ){
            System.debug('Account ID ='+ ar.get('Name '));
            System.debug('Sum Of Account ='+ ar.get('expr0'));
        }
    }
    
    
    public static void quaryDemo(){
        
        //String indus = 'Media';
        Integer AR = 100;
        Set<Id> accIds = new Set<Id>();
        List<Account> accList = [SELECT Id
                                 FROM Account LIMIT 10];
        for(Account acc: accList){
            accIds.add(acc.Id);
            System.debug('Account List contain ' + acc);
        }
        
        
        
        //List<Account> accList1 = [SELECT Id, Name, Phone, Industry, Rating , AnnualRevenue
        //          FROM Account 
        //        WHERE Id IN : accIds
        //      ORDER BY Phone ASC NULLS Last]; 
        for (Account acc: [SELECT Id, Name, Phone, Industry, Rating , AnnualRevenue   //accList1
                           FROM Account 
                           WHERE Id IN : accIds ORDER BY Phone ASC NULLS Last]){
                               System.debug('Account List1 contain =' + acc);}
        
        System.debug([SELECT COUNT(Name) FROM Account ]);
        
    } 
    
}