public class DataFactory {
  
    public static List<Account> createAccountRecord(String name, Integer Count , boolean isInsert){
      List<Account> accList =new List<Account>();
      
    for(Integer i=1;i<=Count;i++){
        Account acc =new Account();
        acc.Name= Name+i;
        acc.Active__c= 'Yes';
        accList.add(acc);
    }
    if(isInsert){
        insert accList;
    }
    
    return accList;
        
        } }