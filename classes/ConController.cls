public with sharing class ConController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(string accId) {
        try {
            return[
                SELECT AccountId, Id,LastName, FirstName
                FROM Contact 
                WHERE AccountId =: accId
                WITH SECURITY_ENFORCED
            ];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}