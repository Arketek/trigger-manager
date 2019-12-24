/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Implements ITriggerHandler to handle all trigger events for Account.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Michael Libman <Mike@Arketek.ca>
* @modifiedBy     Michael Libman <Mike@Arketek.ca>
* @maintainedBy   Michael Libman <Mike@Arketek.ca>
* @version        1.0
* @created        2019-04-21
* @modified       2019-04-21
* @systemLayer    Invocation
* @testClass      AccountTriggerHandler_Test.cls
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.0            Mike@Arketek.ca
* 2019-04-21      + Added method to handle the OnBeforeInsert trigger event.
*				  + Added method to handle the OnAfterInsert trigger event.
*				  + Added method to handle the OnBeforeUpdate trigger event.
*				  + Added method to handle the OnAfterUpdate trigger event.
*				  + Added method to handle the OnBeforeDelete trigger event.
*				  + Added method to handle the OnAfterDelete trigger event.
*				  + Added method to handle the OnUndelete trigger event.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/

public class AccountTriggerHandler implements ITriggerHandler
{
	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* This method fires when the trigger event is 'before insert'.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     newSObjects    A list of values from Trigger.new.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public void OnBeforeInsert(List<sObject> newSObjects)
	{
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* This method fires when the trigger event is 'after insert'.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     newSObjects    A list of values from Trigger.new.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public void OnAfterInsert(List<sObject> newSObjects)
	{
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* This method fires when the trigger event is 'before update'.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     newSObjects      A list of values from Trigger.new.
	* @param     oldSObjects      A list of values from Trigger.old.
	* @param     newSObjectMap    A map of Id as the key and sObject as the value from Trigger.newMap.
	* @param     oldSObjectMap    A map of Id as the key and sObject as the value from Trigger.oldMap.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public void OnBeforeUpdate(List<sObject> newSObjects, List<sObject> oldSObjects, Map<Id, sObject> newSObjectMap, Map<Id, sObject> oldSObjectMap)
	{
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* This method fires when the trigger event is 'after update'.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     newSObjects      A list of values from Trigger.new.
	* @param     oldSObjects      A list of values from Trigger.old.
	* @param     newSObjectMap    A map of Id as the key and sObject as the value from Trigger.newMap.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public void OnAfterUpdate(List<sObject> newSObjects, List<sObject> oldSObjects, Map<Id, sObject> newSObjectMap)
	{
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* This method fires when the trigger event is 'before delete'.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     oldSObjects      A list of values from Trigger.old.
	* @param     oldSObjectMap    A map of Id as the key and sObject as the value from Trigger.oldMap.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public void OnBeforeDelete(List<sObject> oldSObjects, Map<Id, sObject> oldSObjectMap)
	{
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* This method fires when the trigger event is 'after delete'.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     oldSObjects      A list of values from Trigger.old.
	* @param     oldSObjectMap    A map of Id as the key and sObject as the value from Trigger.oldMap.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public void OnAfterDelete(List<sObject> oldSObjects, Map<Id, sObject> oldSObjectMap)
	{
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* This method fires when the trigger event is 'after undelete'.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     newSObjects    A list of values from Trigger.new.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public void OnUndelete(List<sObject> newSObjects)
	{
	}
}