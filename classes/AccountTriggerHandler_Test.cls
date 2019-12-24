/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* The test class for the AccountTriggerHandler.
*
* Test all the various functionality in the AccountTriggerHandler as well as all CRUD events.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Michael Libman <Mike@Arketek.ca>
* @modifiedBy     Michael Libman <Mike@Arketek.ca>
* @maintainedBy   Michael Libman <Mike@Arketek.ca>
* @version        1.0
* @created        2019-04-21
* @modified       2019-04-21
* @systemLayer    Test
* @coverage       100%
* @see            AccountTriggerHandler.cls
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.0            Mike@Arketek.ca
* 2019-04-21      + Created a unit test for when the handler is OnBeforeInsert.
*				  + Created a unit test for when the handler is OnAfterInsert.
*				  + Created a unit test for when the handler is OnBeforeUpdate.
*				  + Created a unit test for when the handler is OnAfterUpdate.
*				  + Created a unit test for when the handler is OnBeforeDelete.
*				  + Created a unit test for when the handler is OnAfterDelete.
*				  + Created a unit test for when the handler is OnUndelete.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/

@IsTest 
private class AccountTriggerHandler_Test 
{
	public static ITriggerHandler handler = new AccountTriggerHandler();

	public static Schema.DescribeSObjectResult sObjectResult = SObjectType.Account;

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests the handlers OnBeforeInsert method.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void OnBeforeInsert_Test()
	{
		List<SObject> newSObjects = SObject_Util.CreateSObjectList(sObjectResult);
		
		handler.OnBeforeInsert(newSObjects);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests the handlers OnAfterInsert method.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void OnAfterInsert_Test()
	{
		List<SObject> newSObjects = SObject_Util.CreateSObjectList(sObjectResult);

		handler.OnAfterInsert(newSObjects);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests the handlers OnBeforeUpdate method.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void OnBeforeUpdate_Test()
	{
		List<SObject> newSObjects = SObject_Util.CreateSObjectList(sObjectResult);
		List<SObject> oldSObjects = SObject_Util.CreateSObjectList(sObjectResult);

		Map<Id, SObject> newSObjectMap = SObject_Util.CreateSObjectMap(sObjectResult);
		Map<Id, SObject> oldSObjectMap = SObject_Util.CreateSObjectMap(sObjectResult);

		handler.OnBeforeUpdate(newSObjects, oldSObjects, newSObjectMap, oldSObjectMap);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests the handlers OnAfterUpdate method.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void OnAfterUpdate_Test()
	{
		List<SObject> newSObjects = SObject_Util.CreateSObjectList(sObjectResult);
		List<SObject> oldSObjects = SObject_Util.CreateSObjectList(sObjectResult);

		Map<Id, SObject> newSObjectMap = SObject_Util.CreateSObjectMap(sObjectResult);
		Map<Id, SObject> oldSObjectMap = SObject_Util.CreateSObjectMap(sObjectResult);

		handler.OnAfterUpdate(newSObjects, oldSObjects, newSObjectMap);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests the handlers OnBeforeDelete method.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void OnBeforeDelete_Test()
	{
		List<SObject> oldSObjects = SObject_Util.CreateSObjectList(sObjectResult);

		Map<Id, SObject> oldSObjectMap = SObject_Util.CreateSObjectMap(sObjectResult);

		handler.OnBeforeDelete(oldSObjects, oldSObjectMap);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests the handlers OnAfterDelete method.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void OnAfterDelete_Test()
	{
		List<SObject> oldSObjects = SObject_Util.CreateSObjectList(sObjectResult);

		Map<Id, SObject> oldSObjectMap = SObject_Util.CreateSObjectMap(sObjectResult);

		handler.OnAfterDelete(oldSObjects, oldSObjectMap);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests the handlers OnUndelete method.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void OnUndelete_Test()
	{
		List<SObject> newSObjects = SObject_Util.CreateSObjectList(sObjectResult);
		
		handler.OnUndelete(newSObjects);
	}
}