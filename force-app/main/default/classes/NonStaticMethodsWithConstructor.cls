public class NonStaticMethodsWithConstructor {
    decimal a;
    // default Constructor 
    /*
    public NonStaticMethodsWithConstructor(){
        a=5; */
    //parameterize Constructor
    public NonStaticMethodsWithConstructor(Decimal val){
        a=val;
    }
        
        
      public void Area(){    //void is a retun type and if we don't want to return a value method Then we Write void
       Decimal area;
       area=a*a;
        system.debug('Square area= '+area);
    }
    
    public void Perimeter(){
       Decimal peri;
       peri=4*a;
        system.debug('Perimeter= '+ peri);
    }

}  /*
NonStaticMethodsWithConstructor s = New NonStaticMethodsWithConstructor ();
s.Area();
s.Perimeter(); */ 

/*NonStaticMethodsWithConstructor s = New NonStaticMethodsWithConstructor ();
s.Area(6);
s.Perimeter(8);*/