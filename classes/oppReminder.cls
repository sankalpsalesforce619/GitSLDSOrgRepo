public class oppReminder implements Schedulable  {
    public void execute(schedulableContext ctx){
        List<Opportunity> oppList = [SELECT Id, StageName, closeDate, OwnerId FROM Opportunity WHERE isClosed = false AND CloseDate<Today];
        
        List<task> taskList= new List<Task>();
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                Task tsk= new Task();
                tsk.Status='Open';
                tsk.Subject='Reminder Task';
                tsk.Priority='Normal';
                tsk.WhatId= opp.id;
                tsk.OwnerId = opp.OwnerId;
                taskList.add(tsk);
                
                
            }
            if(!taskList.isEmpty()){
                    insert taskList;
        }
            }
        
    }

}