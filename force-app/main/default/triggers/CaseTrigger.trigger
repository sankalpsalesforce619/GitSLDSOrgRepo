trigger CaseTrigger on Case (after insert) {
    caseTriggerHandler.PopulateLatestcaseNumber(Trigger.New);

}