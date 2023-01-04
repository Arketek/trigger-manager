@namespaceAccessible
public interface ITriggerHandler
{
	void onBeforeInsert(List<sObject> newSObjects);
	void onAfterInsert(List<sObject> newSObjects);

	void onBeforeUpdate(List<sObject> newSObjects, List<sObject> oldSObjects, Map<Id, sObject> newSObjectMap, Map<Id, sObject> oldSObjectMap);
	void onAfterUpdate(List<sObject> newSObjects, List<sObject> oldSObjects, Map<Id, sObject> newSObjectMap);

	void onBeforeDelete(List<sObject> oldSObjects, Map<Id, sObject> oldSObjectMap);
	void onAfterDelete(List<sObject> oldSObjects, Map<Id, sObject> oldSObjectMap);

	void onUndelete(List<sObject> newSObjects);
}