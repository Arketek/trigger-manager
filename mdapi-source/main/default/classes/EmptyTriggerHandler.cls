public class EmptyTriggerHandler implements ITriggerHandler {
    public void onBeforeInsert(List<SObject> newRecords) {}
    public void onBeforeUpdate(List<SObject> newRecords, List<SObject> oldRecords, Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
    public void onBeforeDelete(List<SObject> oldRecords, Map<Id, SObject> oldMap) {}
    public void onAfterInsert(List<SObject> newRecords) {}
    public void onAfterUpdate(List<SObject> newRecords, List<SObject> oldRecords, Map<Id, SObject> newMap) {}
    public void onAfterDelete(List<SObject> oldRecords, Map<Id, SObject> oldMap) {}
    public void onUndelete(List<SObject> newRecords) {}
}