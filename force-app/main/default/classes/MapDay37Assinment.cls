public class MapDay37Assinment {
    
    public static void Account(){
        
        List<Account> accList = new List<Account>();
        accList=[SELECT Id,Name FROM Account LIMIT 6];
        Map<Id,Account> accMap = new Map<Id,Account>(accList);
        
        System.debug('Account map contailns'+ accMap);
        System.debug('Account Map Key'+ accMap.KeySet());
        System.debug('Account Map Key'+ accMap.Values());
        
    }
    
    Public Static Void AccountWithLoop(){
        List<Account> accList = new List<Account>();
        accList=[SELECT Id,Name FROM Account LIMIT 5];
        Map<Id,Account> accMap = new Map<Id,Account>(accList);
        
        for(Account acc : accList){
            accMap.put(acc.Id,acc);
        }
        
        
        System.debug('Account map contailns'+ accMap);
        System.debug('Account Map Key'+ accMap.keySet());
        System.debug('Account Map Key'+ accMap.Values());
    }
    
    public Static Void Position (){
        List<Position__c> posList = new List<Position__c>();
        posList = [SELECT Id,Name FROM Position__c LIMIT 5];
        Map<Id,Position__c> posMap = new Map<Id,Position__c>(posList);
        
        System.debug('position map contains ='+posMap);
        System.debug('position map keys ='+ posMap.KeySet());
        System.debug('position map values ='+posMap.values());
    }
   
    
        public static void PositionWithLoop(){
        List<Position__c> posList= new List<Position__c>();
        posList=[SELECT Id,Name FROM Position__c LIMIT 5];
        Map<Id,Position__c> posMap = new map <Id,Position__c>(posList);
        
        for(Position__c pos : posList){
            posMap.put(pos.Id,pos);
        }
            
        System.debug('position map contains ='+ posMap);
        System.debug('position key are=' + posMap.KeySet());
        system.debug('position values contain ='+ posMap.Values());
    
    
        }}