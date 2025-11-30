public class SimpleInterest {
    
    public static void calc(){
        Decimal prin=50000, rate=10, t=3;
        
        decimal si=(prin*rate*t)/100;
        
        System.debug('simple intrest=' + si); 
    }
}