public class LoopDemo {
    
    Public Static Void showList(){
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        Map<Id, Account> accMap = new Map<Id, Account>();
        accList= [SELECT Id,Name FROM Account LIMIT 5];
        
        
        // iteration on account list to display data and create a set and Map
        System.debug('Display Data Throth List ');
        if(accList.size()>0){
            for(Account acc: accList){
                 system.debug(acc.Id + '-' + acc.Name);
                accIds.add(acc.Id); // goning to add acc id in set of accIds
                accMap.put(acc.Id, acc); // Map is created
            }
           
        }
        System.debug('Display Data Throth Set ');
        if(!accIds.isEmpty()){
            for(Id accId: accIds){
                System.debug(accId);
            }
        }
        
        //iterate map based on keys
        System.debug('Display Data Throth Map Keys ');
        if(!accMap.isEmpty()){
            for(Id accId : accMap.KeySet()){
                System.debug(accId);
                
            }}
        
        
       
        
        System.debug('Display Data Throth values ');
    //Itrate Map based On Values
    if(!accMap.isEmpty()){
        for(Account acc : accMap.values()){
            System.debug(acc);
        }
    }}
     
        
     /*   if(!accList.isEmpty){
            for(Account acc: accList){
                 system.debug(acc.Id + '-' + acc.Name);}  } */
        
    

    
    
    Public Static Void TableUsingWhile (Integer n){
        Integer i=1;
        while(i<=10){
            system.debug(i*n);
            i++;
        }
    }
    
    
    Public Static Void EvenWithWhile(Integer n){
        Integer i=1;
        While(i<=n){
            if(Math.mod(i,2)==0){
                System.debug(i);
                    i++;
            }
        }
        
    }
    
    
    
    
    public static void forDemo(){
        for(Integer i=1; i<=10; i++){
            System.debug(i);
            
        }
    }
    
    public static void evenNum(Integer n){
        for(Integer i=1; i<=n ; i++){
            if(Math.mod(i,2)==0){
                System.debug(i);
            }
        }
    }
    
    
    Public Static Void SumOfNatuaralNums(Integer n){
        Integer i , sum=0;
        for(i=1;i<=n;i++){
            sum=sum+i;
        }
        System.debug('sum ='+ sum);
        
    }
        
    
     
    public static void oddNum(Integer n){
        for(Integer i=1; i<=n ; i++){
            if(Math.mod(i,2) !=0){
                System.debug(i);
            }
        }
    }
    
    
    Public static void table(Integer n){
        for(Integer i=1 ; i<=10;i++){
            System.debug(n*i);  
        }
    }


}