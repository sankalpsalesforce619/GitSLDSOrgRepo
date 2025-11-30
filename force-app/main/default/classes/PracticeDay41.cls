public class PracticeDay41 {
    
     Public static void JobAWithPosCToP(){
        
           for(Job_application__c ja : [SELECT Id , Name, Position__r.Name, Position__r.Depertment__c
                                FROM Job_application__c ORDER BY CreatedDate ASC]){
                                    System.debug(ja);
                                }}
    
    
    
    
      Public static void JobAWithReviewPToC(){
        
           for(Job_application__c ja : [SELECT Id , Name,(SELECT Id, Name From Interview_Reviews__r)
                                FROM Job_application__c ORDER BY CreatedDate ASC]){
                                    System.debug(ja);
                                }}
    
    
    
    
    Public static void CanJobAppPToC(){
        
           for(Candidate__c can : [SELECT Id , Name,(SELECT Id, Name From Job_applications__r)
                                FROM Candidate__c ORDER BY CreatedDate ASC]){
                                    System.debug(can);
                                }}
    
    
    
    
    Public static void AtoOThisWeekPToC(){
        
        
        for(Account acc : [SELECT Id , Name, Phone,(SELECT Id, Name, CloseDate, StageName From Opportunities)
                           FROM Account WHERE Phone!=null ORDER BY CreatedDate ASC]){
                               System.debug(acc);
                           }}
    
    
    
    
    Public static void ThisWeekCToP(){
        for(Contact con : [SELECT Id, Name ,Phone, Account.Name, Account.Phone FROM Contact WHERE CreatedDate=THIS_WEEK]){
            System.debug(con);
        }
    }
    
    
    Public static void ThisWeekPToC(){
        
        List<Account> accList = new list<Account>();
        accList= [SELECT Id , Name,(SELECT Id, FirstName, LastName From Contacts) FROM Account WHERE CreatedDate= THIS_WEEK];
        
        for(Account acc : accList){
            System.debug(acc);
        }
        
        
        
    }}