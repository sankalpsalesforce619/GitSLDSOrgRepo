public class ConditionalSatetmentDemoMax {
    
     
    
    public static void condtionalOperatorMax (Integer num1, Integer num2){
       Integer result;
       result = num1 > num2 ? num1 :num2;
        System.debug('Maximum is =' + result);
        }
    
    
    
    
    
    public static void NullCheckForAcc(){
        
        List<Account> accList = new List<Account>();
        accList=[SELECT Id FROM Account LIMIT 5];
        if(!accList.isEmpty()){  //not operator true will convert false ! and false will convert to true this ! operator.
            System.debug('List Contains'+ accList);
        }
        
        
        //OR

        if(accList.size()>0){
              System.debug('List Contains'+ accList);
        }
        
        
    }
   

    Public static void SetMethodNullcheck(){
        List<Account> accList =new List<Account>();
        Set<Account> accSet =new Set<Account>(accList);
        accList= [SELECT Id,Name FROM Account LIMIT 5];
        if(!accSet.isEmpty()){
                    System.debug('Account Contains'+ accSet); 
        }
        else {
             system.debug('Account is Null');
     
         
        }
    }

    
    public static void logicalOperator(Integer num1,Integer num2){
        
        if(num1>30 || num2>100){ 
            system.debug('true');
        }
        else{
             system.debug('false');
        }
    } 
    
    
    public static void elseIfladderDemo(Integer num){
        if(num>0){
            system.debug('num is positive');
        }
        else if(num==0){
            system.debug('num is zero');
        }
        else{
            system.debug('num is Negative');
        }
    }
    
    
    public static void NestedIfDemo(Integer num){
        
        if(num>=0){
            if(num>0){
                System.debug('number is positive');
            }
            else{
                System.debug('number is Zero');
            }
        }
        else{
            System.debug('number is Nagative');
        } 
    }
    
    
    
    
    
    
    
    
    public static void Max (Integer num1, Integer num2){
        //Integer num1=20,num2=40;
        
        if(num1>num2){
            system.debug('Num1 is max as compared to num2');
        }
        else {
            system.debug('Num2 is max as compared to num1');
        }
    }
    
    
    public static void age(Integer age){
        
        if(age>=18){
            system.debug('you are eligibal to vote');
        }
        else{
            system.debug('you are not elagibal to vote');
        }
    }
    
    
    public static void checkEvenOdd(Integer num){
        if(Math.mod(num,2)==0){
            System.debug('the number is Even');
        }
        else{
            system.debug('the num is odd');
        }
    }
    
    
}