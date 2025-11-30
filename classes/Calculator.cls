public class Calculator {

    public static void addition(){
        Integer var1=5,var2=10,sum;
        sum= var1 + var2;
        system.debug('addition = '+sum);
    }
    
    public static void subtraction(){
        Integer var1=5,var2=10,sub;
        sub= var1 - var2;
        system.debug('subtraction = '+sub);
    }
    
    public static void multiplication(Integer var1, Integer var2){
        Integer mul;
        mul= var1 * var2;
        system.debug('multiplication = '+mul);
    }
    
    public static void division(Integer var1, Integer var2){
        Integer div;
        div= var1 / var2;
        system.debug('division = '+div);
    }
}