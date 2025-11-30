@RestResource(urlMapping = '/accountmgmt/*')
global class AccountMgmt {
    @httpGet
    global static AccountWrapper getTopAccounts(){
     Map<String,String> paramsMap = RestContext.request.params;
        Set<Id> accountIdSet = new Set<Id>();
      String accIndusrty = paramsMap.get('industry');
        List<Account> accList= [select id, industry, rating, AnnualRevenue 
                                from account 
                                where AnnualRevenue != null and Industry =: accIndusrty
                                order by annualrevenue  desc 
                                limit 10];
        for(Account acc : accList){
            accountIdSet.add(acc.Id);
        }

        List<Contact> conList =[select id, lastname, firstname, email from Contact where accountId in : accountIdSet];  
        List<case> caseList =[select id, priority, subject from case where accountId in : accountIdSet];
         AccountWrapper accWrapper = new AccountWrapper();
         accWrapper.accList =accList;
        accWrapper.conList= conList;
        accWrapper.caseList = caseList;
          return accWrapper;
    }
     
   @httpPost
  /* global static String createAccount(String accName,String accRating,String accIndustry){
        Account acc= new Account();
        acc.Name= accName;
        acc.Rating= accRating;
        acc.Industry= accIndustry;
        try{
            insert acc;
            return 'Account Created Successfully';
        }
        catch(exception ex){
            return ex.getMessage();
        }
        
    }*/
   global static String createAccountAndContact(AccountInformission info){
       Account accrecord= info.accountRecord;
       Contact conrecord= info.contactRecord;
        try{
           insert accrecord;
            conrecord.accountId = accrecord.Id;
            insert conrecord;
            return 'Account and Contact Created Successfully';
        }
        catch(exception ex){
            return ex.getMessage();
            
        }
    }
    @httpdelete
    global static String deleteAccount(){
      Map<String,String> paramsMap = RestContext.request.params;
      String accountId = paramsMap.get('accid');
      List<Account> accList =[select id from account where id =: accountId];
        if(!accList.isEmpty()){
            try{
                delete accList;
               return 'Account deleted Sucessfully';
            }
            catch(exception ex){
                return ex.getMessage();
            }
        }else{
            return 'record not found';
        }
    }

    global class AccountWrapper{
        global List<Account> accList;
        global List<Contact> conList;
        global List<Case> caseList;
    }
 

    global class AccountInformission{
        global Account accountRecord{get;set;}
        global Contact contactRecord{get;set;}
    }

}