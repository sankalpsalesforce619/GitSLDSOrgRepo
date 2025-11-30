public class MyRectangle {
//Method
    public void area() {
        Decimal length =5.5, breadth=6; //variables creation.
        Decimal a = (length*breadth) ;
        System.debug('Area =' + a);
      } 
    
    //Method
    public void perimeter() {
        Decimal length =5.5, breadth=6; //variables creation.
        Decimal p = 2* (length+breadth) ;
        System.debug('Perimeter =' + p);
      }
}