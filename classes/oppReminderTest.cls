@isTest public class oppReminderTest {
 public static string CRON_EXP= '0 0 0 29 11 ? 2025';
    @istest 
    public static void testScheduledjob(){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i=1;i<=5; i++){
            Opportunity opp = new Opportunity();
            opp.Name='opp Test'+i;
            opp.StageName='Prospecting';
            opp.Amount=0;
            opp.CloseDate=date.today().addDays(-7);
            oppList.add(opp);
        }
        insert oppList;
        Set<Id> oppIds = new Set<Id>();
        
        for(Opportunity opp: oppList){
            oppIds.add(opp.Id);
        }
        
        Test.StartTest();
        string jobid = system.Schedule('Create Task', CRON_EXP, new oppReminder());
        Test.StopTest();
        
        List<Task> taskList= [SELECT Id FROM Task WHERE WhatId IN : oppIds];
        System.assertEquals(5, taskList.size());
        
    }
}