public class LoopsSAS {
    
    public static void DoWhileDemo(Integer num){
        Integer count = 1;
        
        do{
            System.debug(count * num);
            count ++;
        }
        while(count<=10);
    }
    
    
    
    
    
    
    
    
    public static void WhileLoopCo(Integer num){
        
        Integer i= 1;
        
        While(i<=10){
          Integer  total= i*num;
            System.debug(num + '*' + i +'=' + total);
            i++;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    public static void EvenS(Integer n){
        for(Integer i=1; i<=n; i++){
            if(Math.mod(i,2)==0){
                System.debug(i);
            }
            
        }
    }
    
       public static void OddS(Integer n){
        for(Integer i=1; i<=n; i++){
            if(Math.mod(i,2)!=0){
                System.debug(i);
            }
            
        }
    }
    
    
    
    Public static void NaturalNum(Integer n){
        Integer i, sum=0;
        for(i=1;i<n;i) {sum=sum+i;}
        
        system.debug('sum of natural Sum is'+ sum);
            
        }
    
        
    
    
    
    Public static void TableS(Integer num){
        Integer i;
        for(i=1;i<=10;i++){
            System.debug(i*num);    
            }
    }
    
    
    
    
  
}