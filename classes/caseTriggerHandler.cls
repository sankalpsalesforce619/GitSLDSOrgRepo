public class caseTriggerHandler {
    Public static void PopulateLatestcaseNumber(List<Case> caseList){
        
        List<Account> accList= new List<Account>();
        
        for(Case cs : caseList){
            if(cs.AccountId != null){
                Account acc = new Account();
                acc.Id=cs.AccountId;
                acc.Latest_case_Number__c=cs.CaseNumber;
                accList.add(acc);
                
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
        
    }
    
}