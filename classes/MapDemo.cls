public class MapDemo {
    
    public static void SObjectDemoWithoutLoop(){
        List<Account> accList = new List<Account>();
        accList= [SELECT Id, Name, CreatedDate FROM Account LIMIT 5 ];
        
        Map<Id, Account> accMap =new map<Id, Account>(accList); //List will be converted to map
        
        System.debug(' Map Contain =' + accMap);
        System.debug(' Map key =' + accMap.keySet()); 
        System.debug(' Map values =' + accMap.values());
    }
    
    
    
    public static void SObjectDemoWithLoop(){
        List<Account> accList = new List<Account>();
        accList= [SELECT Id, Name, CreatedDate FROM Account LIMIT 5 ];
        
        Map<Id, Account> accMap =new map<Id, Account>(accList); //List will be converted to map
        
        for(Account acc : accList){
            accMap.put(acc.id, acc);
        }
        
        
        System.debug(' Map Contain =' + accMap);
        System.debug(' Map key =' + accMap.keySet()); 
        System.debug(' Map values =' + accMap.values());
    }
    
    
    public static void PosSObjectDemoWithLoop(){
        List<Position__c> posList = new List<Position__c>();
        posList= [SELECT Id, Name, CreatedDate FROM Position__c LIMIT 5 ];
        
        Map<Id, Position__c> posMap =new map<Id, Position__c>(posList); //List will be converted to map
        
        for(Position__c pos : posList){
            posMap.put(pos.id, pos);
        }
        
        
        System.debug(' Map Contain =' + posMap);
        System.debug(' Map key =' + posMap.keySet()); 
        System.debug(' Map values =' + posMap.values());
    }
    
    
    
    public static void PositionWithLoop(){
        List<Position__c> posList= new List<Position__c>();
        posList=[SELECT Id,Name FROM Position__c LIMIT 5];
        Map<Id,Position__c> posMap = new map <Id,Position__c>(posList);
        
        
    }
    
    
    
    
    public static void demo(){
        Map<Integer,String> colors = new Map<Integer,String>();
        Map<Integer,String> moreColors = new Map<Integer,String>();
        Map<integer,String> ClonedMap = new Map<Integer,String>();
        Set<Integer> intSet = new Set<Integer>();
        List<String> strList =new List<String>();
        
        Colors.put(1,'Green');
        Colors.put(2,'Blue');
        colors.put(3,'Red');
        colors.put(4,'Blue');
        System.debug('Map contains...'+ colors);
        colors.put(2,'yellow');
        System.debug('Map contains...'+ colors);
        moreColors.put(10,'Black');
        moreColors.put(20,'White');
        moreColors.put(1,'Pink');
        colors.putAll(moreColors);
        System.debug('Map contains...'+ colors);
        
        Colors.remove(1);
        System.debug('Map contains...'+ colors);
        System.debug('Map contains Size...'+ colors.size());
        System.debug('Map contains...'+ colors.values());
        //colors.clear();
        ClonedMap= colors.Clone();
        System.debug('Cloned Map contains...'+ clonedMap);
        System.debug('Cloned Map ContainsKey contains...'+ clonedMap.ContainsKey(50));
        System.debug('Cloned Map contains...'+ clonedMap.ContainsKey(10));
        System.debug('Cloned Map contains...'+ clonedMap.equals(colors));
        System.debug('Cloned Map contains...'+ clonedMap.equals(moreColors));
        
        System.debug('Cloned Map contains...'+ clonedMap.get(10));
        
        System.debug('Cloned Map contains...'+ clonedMap.isEmpty());
        System.debug('Cloned Map contains...'+ clonedMap.keySet());
        
        intSet= clonedMap.keySet();
        strList= clonedMap.values();
        System.debug('Set Contains keyset'+ intSet);
        System.debug('list Contains value'+ strList);
        
        
    }}