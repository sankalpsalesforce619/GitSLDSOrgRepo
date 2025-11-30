public class RectangleWithConstructor {
    Decimal length, breadth;
     //constuctor
     public RectangleWithConstructor(Decimal l, Decimal b) {
         length=l;
         breadth=b; }
//Method
    public void area() {
         //variables creation.
        Decimal a = (length*breadth) ;
        System.debug('Area =' + a);
      } 
    
    //Method
    public void perimeter() {
       //variables creation.
        Decimal p = 2* (length+breadth) ;
        System.debug('Perimeter =' + p);
      }
}