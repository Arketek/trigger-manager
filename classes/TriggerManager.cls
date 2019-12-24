/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* Manages trigger functionality by appropriately dispatching CRUD events to their handler.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Michael Libman <Mike@Arketek.ca>
* @modifiedBy     Michael Libman <Mike@Arketek.ca>
* @maintainedBy   Michael Libman <Mike@Arketek.ca>
* @version        1.0
* @created        2019-04-18
* @modified       2019-04-18
* @systemLayer    Invocation
* @testClass      TriggerManager_Test.cls
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.0            Mike@Arketek.ca
* 2019-04-18      + Created a dispatch method to navigate the trigger handler to its CRUD event.
*                 + Created a method verify if a valid trigger handler is being used.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/

public class TriggerManager  
{
	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Dispatches trigger events to handler event.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     handler    The instantiated trigger handler class.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public static void Dispatch(ITriggerHandler handler)
	{
		if (!IsValidTriggerHandler(handler))
		{
			throw new TriggerManagerException('Invalid ITriggerHandler.');
		}

		if (Trigger.isBefore)
		{
			if (Trigger.isInsert)
			{
				handler.OnBeforeInsert(Trigger.new);
			}
			else if (Trigger.isUpdate)
			{
				handler.OnBeforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
			}
			else if (Trigger.isDelete)
			{
				handler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
			}
		}
		else if (Trigger.isAfter)
		{
			if (Trigger.isInsert)
			{
				handler.OnAfterInsert(Trigger.new);
			}
			else if (Trigger.isUpdate)
			{
				handler.OnAfterUpdate(Trigger.new, Trigger.old, Trigger.newMap);
			}
			else if (Trigger.isDelete)
			{
				handler.OnAfterDelete(Trigger.old, Trigger.oldMap);
			}
			else if (Trigger.isUndelete)
			{
				handler.OnUndelete(Trigger.new);
			}
		}
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Returns an instance of the trigger handler. Ensures that the sObject ends with 'TriggerHandler'
	* as a class name.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     sObjType           The sObject's type of the trigger handler class.
	* @return    ITriggerHandler    Returns the appropriate trigger handler object.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public static Boolean IsValidTriggerHandler(Object handler)
	{
		if (handler == null || !(handler instanceof ITriggerHandler))
		{
			return false;
		}

		return true;
	}
}