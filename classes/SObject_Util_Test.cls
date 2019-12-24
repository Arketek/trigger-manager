/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* The test class for the SObject_Util.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Michael Libman <Mike@Arketek.ca>
* @modifiedBy     Michael Libman <Mike@Arketek.ca>
* @maintainedBy   Michael Libman <Mike@Arketek.ca>
* @version        1.0
* @created        2019-04-21
* @modified       2019-04-21
* @systemLayer    Test
* @coverage       100%
* @see            SObject_Util.cls
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.0            Mike@Arketek.ca
* 2019-04-21      + Created unit test for CreateSObject.
*                 + Created unit test for CreateSObjectList.
*                 + Created unit test for CreateSObjectMap.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/

@isTest 
private class SObject_Util_Test 
{
	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Unit tests the creation of making an SObject from the utility class.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void CreateSObject_Test()
	{
		Account anAccount = (Account) SObject_Util.CreateSObject(SObjectType.Account);

		System.assertNotEquals(null, anAccount);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Unit tests the creation of making an SObject list from the utility class.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void CreateSObjectList_Test()
	{
		List<Account> accounts = (List<Account>) SObject_Util.CreateSObjectList(SObjectType.Account);

		System.assertNotEquals(null, accounts);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Unit tests the creation of making an SObject map from the utility class.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void CreateSObjectMap_Test()
	{
		Map<Id, Account> accounts = (Map<Id, Account>) SObject_Util.CreateSObjectMap(SObjectType.Account);
		
		System.assertNotEquals(null, accounts);
	}
}