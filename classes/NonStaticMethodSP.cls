public class NonStaticMethodSP { 
    public void Area(){
       Decimal a=5, area;
       area=a*a;
        system.debug('Square area= '+area);
    }
    
    public void Perimeter(){
       Decimal a=5, peri;
       peri=4*a;
        system.debug('Perimeter= '+ peri);
    }
}

// NonStaticMethodSP Sp = New NonStaticMethodSP();
// Sp.Area();
// Sp.Perimeter();