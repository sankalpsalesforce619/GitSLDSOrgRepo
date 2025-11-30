public class PopulateAccBillingToReletedContact implements Database.Batchable<sObject> { 
    
    public Database.Querylocator Start (Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id,BillingStreet,BillingState,BillingPostalCode,BillingCountry,BillingCity,
                                         (SELECT Id,MailingStreet,MailingState,MailingPostalCode,MailingCountry,MailingCity FROM Contacts) FROM Account]);
       
    }
    
    
    public void execute (Database.BatchableContext bc, List <Account> accList ){
        List<Contact> conList = new List<Contact>();
        if(!accList.isEmpty()){
            for(Account acc: accList){
               Contact con= new Contact();
                con.LastName= acc.Name;
                con.MailingStreet = acc.BillingStreet;
                con.MailingState = acc.BillingState;
                con.MailingPostalCode = acc.BillingPostalCode;
                con.MailingCountry = acc.BillingCountry;
                con.MailingCity = acc.BillingCity;
                con.AccountId= acc.Id;
                conList.add(con);
             }
            update conList;
        }
    }
    
    public void finish(database.BatchableContext bc){
        System.debug('we have Sucessfully copyed billing to mailing');
        
    }

}