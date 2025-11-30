public with sharing class ContController {
   
  @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
                return [SELECT Id, Name, Phone, Email 
                FROM Contact 
                WITH_SECURITY_ENFORCED 
                LIMIT 10];
            }
      
    

    

}