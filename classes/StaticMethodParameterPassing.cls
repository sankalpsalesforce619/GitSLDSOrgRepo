public class StaticMethodParameterPassing {

      public Static void Area(Decimal a){
       decimal Area;
        Area= a*a;
        system.debug('Area ='+Area);
     }
    
    public static void Perimeter(Decimal a){
       Decimal peri;
       peri=4*a;
        system.debug('Perimeter= '+ peri);
    }
}

/*StaticMethodParameterPassing.area(5);
StaticMethodParameterPassing.Perimeter(5);*/