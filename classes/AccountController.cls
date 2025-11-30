public class AccountController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accList = [SELECT Id,Name FROM Account Limit 10];
            return accList;
    }

}