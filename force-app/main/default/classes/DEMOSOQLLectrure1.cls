public class DEMOSOQLLectrure1 {
    
    /*n bind variable
     String 
     Integer
     Collection 
       List
       Set
       Map */
  
    
    public static void SOQLDEMO(){
        Integer AR = 100;
        Set<Id> accIds = new Set<Id>();
        List<Account> accList = [SELECT Id
                                 FROM Account 
                                  LIMIT 10];    //ASC DESC NULL FIRST/LAS
        
        
        for (Account acc : accList){
            accIds.add(acc.Id);
            
        }
        
        List<Account> accList1 = [SELECT Id, Name , Rating 
                                  FROM Account 
                                  WHERE Id IN: accIds];
            for (Account acc : accList1){
            system.debug(acc);
        }
    }

}