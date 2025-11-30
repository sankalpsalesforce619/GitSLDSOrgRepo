public class PractiseDay40 {
    
    Public static void CaseQue(){
        for(Case cs : [SELECT Id, Origin, Status FROM Case WHERE Origin='Web' AND Status='New']){
            System.debug(cs);
        }
    }
    
    
    Public static void OppSort(){
        for(Opportunity opp : [SELECT Id, Name  FROM Opportunity ORDER BY Name ASC ]){
            System.debug(opp);
        }}
    
    
    
    
    Public static void Annualrev(){
        Integer Arl= 100000;
        Integer Arh= 150000;
        for(Account acc : [SELECT Id, Name , AnnualRevenue FROM Account WHERE AnnualRevenue>=: Arl AND AnnualRevenue<=: Arh]){
            System.debug(acc);
            
            
        }
    }
    
    public static void SOQLApexTest(){
        List<Contact> conList =[SELECT Id, Name, Email FROM Contact WHERE Email!=null];
        for(Contact con : conlist){
            system.debug(con);
        }
    }

}