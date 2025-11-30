public class CustomSObjectDemo {
    
    public static void createPosition(){
        
        Position__c pos = new Position__c();
        pos.RecordTypeId='012dM00000A58LlQAJ';
        pos.Name='SalesForce PD1 02';
        insert pos;
    }
    
    public static void createCandidate(){
        Candidate__c can = new Candidate__c();
        can.Name='101 candidate';
        can.First_Name__c='Ram';
        can.Last_Name__c='501';
        can.Status__c='New';
        insert can;
        
    }
    
    public static void createJobApplication(){
        
        
        Position__c pos = new Position__c();
        pos.RecordTypeId='012dM00000A58LlQAJ';
        pos.Name='SFDC 03';
        insert pos;
        
        Candidate__c can = new Candidate__c();
        can.Name='102 candidate';
        can.First_Name__c='sankalp';
        can.Last_Name__c='402';
        can.Status__c='New';
        insert can;
        
        Job_application__c ja = new Job_application__c();
        ja.Name=pos.Name;
        ja.Position__c=pos.Id;
        ja.Candidate__c=can.Id;
        ja.Application_Status__c='Applied';
        insert ja;
        
        
        Interview_Review__c rv = new Interview_Review__c();CustomSObjectDemo.createJobApplication();

        rv.Job_application__c = pos.Id;
        rv.Name=can.Name;
        rv.Rating__c = '6';
   
        insert rv;
        
    }
    
}

//CustomSObjectDemo.createJobApplication();