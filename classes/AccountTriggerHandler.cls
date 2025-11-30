public class AccountTriggerHandler {
    
    public static Boolean handaleAccount(List<Account> accList){
        
        
        if(Trigger.isExecuting){
            //Do whatever you want to do as part of the trigger invocation
              System.debug('Trigger is Executing: '+ Trigger.isExecuting);
        }			
        else{
            // Do whatever you want to do if the call originated from a different context
             System.debug('Without Trigger');
        }
        return Trigger.isExecuting;
    }
    
    
    
    public static void updateAccount(List<Account> accList , Map<Id, Account> accOldMap){
        List<Account> accToBeUpdated = new List<Account>();
        
        for(Account acc: accList){
            Account a =new Account();
            a.Id=acc.Id;
            a.Description='Test Resursion';
             
            accToBeUpdated.add(a);
        }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }
    }
    

    
    public static void preventDeletion(List<Account> accList){
        Profile p= [SELECT Id FROM Profile WHERE Name='System Administrator']; //due to here we have assing an System Admin 
        for(Account acc: accList){
            if(UserInfo.getProfileId() != p.Id || acc.Active__c=='Yes'){   // System Admin Won't be able delete record 
                acc.addError(Label.Prevent_Account_Deletion);  //We Have Use Custom Label
            }
        }
        
    }
         
         
    public static void copyBillingToshipping(List<Account> accList, Map<Id, Account> OldMap){
        for(Account acc: accList){
            if(oldMap !=Null && acc.CopyBillingToShipping__c){
                acc.ShippingCity=acc.BillingCity;
                acc.ShippingCountry=acc.BillingCountry;
                acc.ShippingPostalCode=acc.BillingPostalCode;
                acc.ShippingState= acc.BillingState;
                acc.ShippingStreet=acc.BillingStreet;
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
        
    }
    
    
    
    Public static void updateRelatedContactMalingAcc(List<account> accList, Map<Id, Account> oldMap){
       // Map<Id, Account> accToAccMap = new Map<Id, Account>(); 
        List<Contact> conList =new List<Contact>();
        set<Id> accIds = new Set<Id>();
        
        for(Account acc : accList){
            if(acc.BillingCity != oldMap.get(acc.Id).BillingCity 
               ||acc.BillingCountry != oldMap.get(acc.Id).BillingCountry
               ||acc.BillingPostalCode != oldMap.get(acc.Id).BillingPostalCode
               ||acc.BillingState != oldMap.get(acc.Id).BillingState
               ||acc.BillingStreet != oldMap.get(acc.Id).BillingStreet
               && oldMap!=null){
                  // accToAccMap.put(acc.Id, acc);
                     accIds.add(acc.Id);
               }
        }
        
       /* for(Contact con: [SELECT Id, Accountid FROM Contact 
                          WHERE AccountId IN: accToAccMap.KeySet()]){
                              if(accToAccMap.containsKey(con.AccountId)){
                                  con.MailingCity=accToAccMap.get(con.AccountId).BillingCity;
                                  con.MailingCountry=accToAccMap.get(con.AccountId).BillingCity;
                                  con.MailingPostalCode=accToAccMap.get(con.AccountId).BillingPostalCode;
                                  con.MailingState=accToAccMap.get(con.AccountId).BillingState;
                                  con.MailingStreet=accToAccMap.get(con.AccountId).BillingStreet;
                              }
                              conList.add(con);
                              
                          } */
        for(Account acc: [SELECT ID, BillingCity,BillingCountry, BillingPostalCode,BillingState,BillingStreet ,
                          (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accIds ]){
                              
                              if(acc.Contacts != null ){
                                  for(Contact con: acc.Contacts){
                                      con.MailingCity = acc.BillingCity;
                                      con.MailingCountry = acc.BillingCountry;
                                      con.MailingPostalCode = acc.BillingPostalCode;
                                      con.MailingState = acc.BillingState;
                                      con.MailingStreet = acc.BillingStreet;
                                       conList.add(con);
                                  }
                              }
                          }
        
        if(!conList.isEmpty()){
            update conList;
        }
        
        
    }
    
    
    
    
    
    Public static void updateRelatedContact(List<Account> accList, Map<Id, Account> accOldMap){
        List<Contact> conList = new List<Contact>();
        Set<Id> accIds = new Set<Id>();
        
        
        for(Account acc : accList){
            if(acc.Phone != accOldMap.get(acc.Id).Phone){           // Map will store only those account whose phone is updated
                accIds.add(acc.Id);
                
            }
        }
        
        for(Account acc:[SELECT Id, Phone,(SELECT HomePhone FROM Contacts) FROM Account WHERE Id IN: accIds]){
            if(acc.Contacts != null){
                for(Contact con: acc.Contacts){
                    con.HomePhone=acc.Phone;
                    conList.add(con);
                }
            }
        }
        
        if(!conList.isEmpty()){
            update conList;
        }
    }
    
    
    
    
        public static void  updateRelatedOpportunityStage(List<Account> accList , Map<Id, Account> oldMap){
        List<Opportunity> oppList = new List<Opportunity>();
         Set<Id> accIds = new Set<Id>();
                 
            for(Account acc : accList){
                  if(acc.Active__c == 'No' && oldmap.get(acc.Id).Active__c == 'Yes'){
                      accIds.add(acc.Id);
            }
      }
        
            if(!accIds.isEmpty()){
                for(Account acc : [SELECT Id, Active__c,(SELECT Id, StageName FROM Opportunities) FROM Account WHERE Id IN: accIds]){
                    if(acc.Opportunities != null){
                        for(Opportunity opp : acc.Opportunities){
                            if(opp.StageName != 'Closed Won'   && opp.StageName != 'Closed Lost'){
                                opp.StageName= 'Closed Lost';
                                oppList.add(opp);
                            }
                            
                        }
                    }
                }
              
            }
            if(!oppList.isEmpty()){
                update oppList;
            }
    }
   
    
    /* Public static void updateRelatedContact(List<Account> accList, Map<Id, Account> accOldMap){
List<Contact> conList = new List<Contact>();
Map<Id, Account> accMap = new Map<Id, Account>();

for(Account acc : accList){
if(acc.Phone != accOldMap.get(acc.Id).Phone){           // Map will store only those account whose phone is updated
accMap.put(acc.Id, acc); }
}

for(Contact con : [SELECT Id, HomePhone, AccountId FROM Contact WHERE AccountId IN: accMap.keySet()]){
if(accMap.containsKey(con.AccountId)){
con.HomePhone = accMap.get(con.AccountId).Phone;
conList.add(con);  }
}

if(!conList.isEmpty()){
update conList;
}
}*/
    
    
    Public static void updatePhone(List<Account> accList, Map<Id, Account> accOldMap){
        
        for(Account acc: accList){
            if(acc.Phone != accOldMap.get(acc.Id).Phone){
                acc.Description='Ph  one is updated | Old Value =' + accOldMap.get(acc.Id).Phone + '  new Value = ' + acc.Phone;
            }
        }
        
        
    }    
    
    Public static void CreateContactOrOpp(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc : accList){
            if(acc.New_Contact__c){
                Contact con = new Contact();
                con.FirstName='Test';
                con.LastName='Test'+ acc.Name;
                con.AccountId=acc.Id;
                conList.add(con); 
                
            }
            if(acc.New_Opportunity__c && acc.Active__c=='Yes'){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.StageName='Prospecting';
                opp.Amount=0;
                opp.CloseDate=System.today();
                opp.AccountId=acc.Id;
                oppList.add(opp);
                
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
             // detabase method to throw errors
              Database.SaveResult[] srList = DataBase.insert(oppList,false);
               for(Integer i=0;i<srList.size();i++){
                   if(!srList[i].isSuccess()){
                 String errors='';
                    for(DataBase.Error err:srList[i].getErrors()){
                        errors=errors+err.getMessage();
                    }
                   accList[i].addError(errors);
                   }
        }
       
        
    }
    
 /*  not in use
    public static void createConWhenAccIsCreated(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc: accList){
            
            
            Contact con = new Contact();
            con.FirstName='Test';
            con.LastName='Test'+ acc.Name;
            con.AccountId=acc.Id;
            conList.add(con); 
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
    
*/    
    //Not in Use
    /*
    public static void CreateOpp(List<Account> accList){
        List<Opportunity> oppList= new List<Opportunity>();
        
        for(Account acc: accList){
            if(acc.Active__c=='Yes'){
                Opportunity opp =new Opportunity();
                opp.Name=acc.Name;
                opp.CloseDate= System.today();
                opp.StageName='Prospecting';
                opp.AccountId=acc.Id;
                //acc.AnnualRevevenue=1000000;
                oppList.add(opp);
            }
            
        }
        
      if(!oppList.isEmpty()){
           
          update oppList;
        }
        
    }
*/
    
    
    public static void CopyBillingAddToShip(List<Account> accList , Map<Id, Account> oldMap){
        for(Account acc: accList){
            if((oldMap == null && acc.CopyBillingToShipping__c) || 
               (acc.CopyBillingToShipping__c && acc.CopyBillingToShipping__c != oldMap.get(acc.Id).CopyBillingToShipping__c)){
                   acc.ShippingCity=acc.BillingCity;
                   acc.ShippingCountry=acc.BillingCountry;
                   acc.ShippingPostalCode=acc.BillingPostalCode;
                   acc.ShippingState=acc.BillingState;
                   acc.ShippingStreet=acc.BillingStreet;
               }
        }
        
    }
    
    
    
    public static void updateDesc(List<Account> accList){
        for(Account acc: accList){  
            //Trigger.New is an sObject List
            acc.Description = 'Account is created'; 
        }
    }
    
    
    
    Public static void PopulateRating(List<Account> accList, Map<Id, Account> accOldMap){
        for(Account acc: accList){
            if((accOldMap == null && acc.Industry != null && acc.Industry=='Media')
               || (accOldMap != null && acc.Industry != null && acc.Industry != accOldMap.get(acc.Id).Industry && acc.Industry=='Media')){
                   acc.Rating = 'Hot';
                   
               }
        }
        
    }
    
    
    

    
    
    /*
    //Not in Use
    public static void updateRating(List<Account> accList){
        for(Account acc: accList){  
            if(acc.Industry =='Energy' || acc.Industry=='Media'){
                acc.Rating='Hot';
                
                
                
            }}
    }*/
    /* Test single record
Account acc = new Account();
acc.Name= 'test record 101 single';
acc.Active__c ='Yes';
acc.Industry='Media';
insert acc;

test multipule
List<Account> accList = new List<Account>();
for(Integer i=1;i<=5;i++){
Account acc = new Account();
acc.Name= 'test record single'+i;
acc.Active__c ='Yes';
acc.Industry='Media';
accList.add(acc);
}
insert accList;*/
}