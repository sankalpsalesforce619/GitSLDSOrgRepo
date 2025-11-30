public class SetDemo {
    
    
    Public static void demoCustomObjectWithSet(){
        Set<Id> posIds = new Set<Id>();
        List<Position__c> posList = new List<position__c>();
        
        posList = [SELECT Id FROM Position__c LIMIT 5];
        
        for(Position__c pos : posList){
            posIds.add(pos.Id);
        }
        System.debug('Set Contains =' + posIds);
    }
        
        Public Static void customobjectWithSet(){
            
            Set<Id> canIds = new Set<Id>();
            List<Candidate__c> canList = new List<Candidate__c>();
            
            canList = [SELECT Id FROM Candidate__c Limit 5];
            for(Candidate__c can : canList){
                canIds.add(can.Id);
            }
            System.debug('Candidate Id List'+ canIds);
        }
    
    
    
    
    
    public static void demoSobjectWithSet(){
        Set<Id> accIds =new set<Id>();
        Set<String> accName = new Set<String>();
        List<Account> accList = new List<Account>();
        
        accList = [SELECT Id, Name FROM Account LIMIT 5];
        
        for(Account acc : accList){
            accIds.add(acc.Id);
            accName.add(acc.Name);
        }
        System.debug('Set Contains ='+ accIds);
        System.debug('Set Contains ='+ accName);
    }
    
    public static void demo (){
        Set<Integer> inSet = new Set<Integer>();
        List<Integer> inList = new List<Integer>();
        Set<Integer> clonedSet =new Set<Integer>();
        
        
        inSet.add(10);
        inSet.add(20);
        inSet.add(30);
        inset.add(20);
        
        inList.add(50);
        inList.add(60);
        inList.add(30);
        
        inSet.addAll(inList);
        //inList.addAll(inSet);
        System.debug('Set Contains =' + inSet);
        clonedSet= inSet.clone();
        System.debug('Cloned set Contains =' + clonedSet);
        
        System.debug('Element is available ='+ inSet.contains(70));
        System.debug('Element is available ='+ inSet.containsAll(inList));
        
        System.debug('Equal ='+ inSet.equals(clonedSet));
        System.debug('Empty ='+ inSet.isEmpty());
        inSet.remove(20);
        System.debug('Set Contains =' + inSet); // 10,30,50,60
        
        inSet.retainAll(inList); //inList is removed fron inset
        System.debug('Set contails'+ inSet);
        
        System.debug('set contains' + inSet.size());
        
        /*   inSet.removeAll(inList); //inList is removed fron inset
System.debug('Set contails'+ inSet);*/
        
        
    }
    
}