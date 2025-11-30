public class Listdemo {
    
    public static void sObjectListDemo(){
        List<Account> accList = new List<Account>();
       Account acc1 = new Account(Name='Acc1201',Active__c='Yes');
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name='Acc1201';
        acc2.Active__c='Yes';
        accList.add(acc2);

        insert accList;
    }
    
        
    public static void sObjectListPosition(){
        List<Position__c> posList = new List<Position__c>();
       Position__c pos1 = new Position__c(Name='Dev');
        PosList.add(pos1);
        
    Position__c pos2 = new Position__c(Name='QA');
        pos2.Name='Dev1';
        posList.add(pos2);

        insert posList;
    }
    
    
    
    public static List<String> returnDemo(String str1, String str2){
        List<String> colors =new List<String>{'Red','Yellow','Green'};
            /* List<String> colors =new List<String>();
colors.add('Red');
colors.add('Yellow');
colors.add('Blue');*/
            colors.add(str1);
             colors.add(str2);
            return colors;
    }
    public static void listDemoMethod (){
        List<String> returnedValue = new list<String>();
        returnedValue=returnDemo('black','purpal');
        System.debug('Colors list Contain ='+  returnedValue);
        
        List<String> colors = new List<String>();
        colors.add('Red');
        colors.add('Yellow');
        colors.add('Blue');
        colors.add('Yellow');
        colors.add('Green');
        
        System.debug('Colors list Contain ='+colors);
        
        colors.add(1, 'Black');
        System.debug('Colors list Contain ='+colors);
        
        
        List<String> colorsList2 = new List<String>();
        colorsList2.add('Purple');
        colorsList2.add('White');
        
        colors.addAll(colorsList2);  //adding list2 to value to list 1
        System.debug('Colors list Contain ='+colors);
        System.debug('Colors list Contain ='+colorsList2);
        colorsList2.clear();  //clear list
        System.debug('Colors list Contain ='+colorsList2);
        
        List<String> clonedList = new List<String>();
        clonedList=colors.clone();
        System.debug('cloned value is =' + clonedList);
        
        System.debug('cloned list Contain  =' + colors.contains('pink'));
        System.debug('cloned list Contain  =' + colors.equals(colorsList2));
        
        System.debug('cloned list Contain  =' + colors.get(3));
        System.debug('cloned list Contain  =' + colors.indexOf('Green'));
        System.debug('Empty ='+ colorsList2.isEmpty()); 
        colors.remove(3);
        System.debug('Colors list Contain ='+colors);
        System.debug('colors size  =' + colors.size());
        System.debug('colorsList2='+ colorsList2.size());
        colors.sort();
            System.debug('Sorted value =' + colors);
    }
    
}

/*Listdemo.sObjectListDemo()

List<Account> accList = [SELECT Id, Name FROM Account LIMIT 5];
System.debug('Account List =' +accList);

List<Position__c> posList = [SELECT Id, Name FROM Position__c
                            WHERE 	Staus__c='open'];
System.debug('position LIST= '+ posList);*/