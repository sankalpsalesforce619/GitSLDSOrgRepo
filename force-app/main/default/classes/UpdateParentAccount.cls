public class UpdateParentAccount implements Queueable {
    
    //variables of class
    private List<Account> accList;
    private Id parentAccId;
    
    //constructor
    public UpdateParentAccount (List<Account> accRecords, Id accId){
        this.accList=  accRecords;
        this.parentAccId = accId;
    }
    
    //method
    public void execute(QueueableContext context){
        for(Account acc: accList){
            acc.parentId=parentAccId;
       
        }
        update accList;
    }

}
/*List<Account> accList = [SELECT Id FROM Account WHERE BillingState= 'TX'];

Id parentId = [SELECT Id FROM Account WHERE Name = '1304'][0].id;

UpdateParentAccount UpdateJob = new UpdateParentAccount(accList, ParentId);

id jobId= System.enqueueJob(UpdateJob);*/