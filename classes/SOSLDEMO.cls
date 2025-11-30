public class SOSLDEMO {
    public static void test(){
    List<List<Account> > SearchList = [FIND 'test' IN ALL FIELDS RETURNING Account(Name), Contact ( FirstName, LastName, Email)];
    
            System.debug(SearchList);
        
         
       

    }}