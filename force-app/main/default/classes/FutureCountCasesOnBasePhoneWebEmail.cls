public class FutureCountCasesOnBasePhoneWebEmail {


    @future public static void count(List<Id> accIds){
        List<Account> accList= [SELECT Id , Case_Count_On_Phone__c, Case_Count_On_Email__c,Case_Count_On_Web__c,(SELECT Id FROM  Cases) FROM Account WHERE Id IN: accIds ];
        for(Account acc: accList){
           
        }
    }

}