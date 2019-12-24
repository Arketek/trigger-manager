/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* A interface used for all trigger handlers.
*
* This interface forces the trigger handler to implement the appropriate methods
* to ensure that all trigger events are being handled.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Michael Libman <Mike@Arketek.ca>
* @modifiedBy     Michael Libman <Mike@Arketek.ca>
* @maintainedBy   Michael Libman <Mike@Arketek.ca>
* @version        1.0
* @created        2019-04-18
* @modified       2019-04-18
* @systemLayer    Invocation
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.0            Mike@Arketek.ca
* 2019-04-18      + Added method definition for the OnBeforeInsert trigger event.
*				  + Added method definition for the OnAfterInsert trigger event.
*				  + Added method definition for the OnBeforeUpdate trigger event.
*				  + Added method definition for the OnAfterUpdate trigger event.
*				  + Added method definition for the OnBeforeDelete trigger event.
*				  + Added method definition for the OnAfterDelete trigger event.
*				  + Added method definition for the OnUndelete trigger event.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/

public interface ITriggerHandler
{
	void OnBeforeInsert(List<sObject> newSObjects);
	void OnAfterInsert(List<sObject> newSObjects);

	void OnBeforeUpdate(List<sObject> newSObjects, List<sObject> oldSObjects, Map<Id, sObject> newSObjectMap, Map<Id, sObject> oldSObjectMap);
	void OnAfterUpdate(List<sObject> newSObjects, List<sObject> oldSObjects, Map<Id, sObject> newSObjectMap);

	void OnBeforeDelete(List<sObject> oldSObjects, Map<Id, sObject> oldSObjectMap);
	void OnAfterDelete(List<sObject> oldSObjects, Map<Id, sObject> oldSObjectMap);

	void OnUndelete(List<sObject> newSObjects);
}