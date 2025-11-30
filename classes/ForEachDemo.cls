public class ForEachDemo {  //creat set and map //set id   // map itreation key's and value's 
    
    public static void ForListMethod(){
        
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        Map<Id, Account> accMap = new Map<Id, Account>();
        accList = [SELECT Id, Name FROM Account LIMIT 5];
        
        
         System.debug('Data Display Throuth a List');
        if(accList.Size()>0){
            for(Account acc : accList){
                System.debug(acc.Id +'-'+ acc.Name);
                accIds.add(acc.Id);
                accMap.put(acc.Id, acc);  
            } 
        }
        
        
        System.debug('Data Display Throuth a Set');
        if(!accIds.isEmpty()){
            for(Id accid : accIds){
                System.debug(accid);
            }
            
        }

            System.debug('Data Display Throuth a Map keys ');
        if(!accMap.isEmpty()){
            for(Id accMapId : accMap.keyset()){
                System.debug(accMapId);
            }
            
        }

        
         System.debug('Data Display Throuth a Map values ');
        if(!accMap.isEmpty()){
            for(Account accMapName : accMap.values()){
                System.debug(accMapName);
            }
            
        }        
        
        
    }
}