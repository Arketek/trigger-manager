/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* The test class for the TriggerManager.
*
* Test all the various functionality in the TriggerManager as well as all CRUD events.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Michael Libman <Mike@Arketek.ca>
* @modifiedBy     Michael Libman <Mike@Arketek.ca>
* @maintainedBy   Michael Libman <Mike@Arketek.ca>
* @version        1.0
* @created        2019-04-18
* @modified       2019-04-18
* @systemLayer    Test
* @coverage       100%
* @see            TriggerManager.cls
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.0            Mike@Arketek.ca
* 2019-04-18      + Created unit test to test invalid trigger handlers that is dispatched.
*                 + Created unit test to test valid trigger handlers.
*                 + Created unit test to test null trigger handlers.
*                 + Created unit test to test classes that don't implement ITriggerHandler.
*                 + Created unit test to test before and after insert events.
*                 + Created unit test to test before and after update events.
*                 + Created unit test to test before and after delete events.
*                 + Created unit test to test after undlete events.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/

@IsTest
public class TriggerManager_Test  
{
	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Throws an exception to test when an invalid trigger handler is dispatched.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void DispatchInvalidTriggerHandler_Test()
	{
		TriggerManagerException tmException = null;

		try
		{	        
			ITriggerHandler handler = null;
			
			TriggerManager.Dispatch(handler);
		}
		catch (TriggerManagerException e)
		{
			tmException = e;
		}
		System.assertNotEquals(null, tmException);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Testes for a valid trigger handler.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void IsValidTriggerHandler_Test()
	{
		AccountTriggerHandler handler = new AccountTriggerHandler();

		Boolean isValid = TriggerManager.IsValidTriggerHandler(handler);
		System.assertEquals(true, isValid);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Testes for a null trigger handler.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void IsValidTriggerHandlerNull_Test()
	{
		AccountTriggerHandler handler = null;
		
		Boolean isValid = TriggerManager.IsValidTriggerHandler(handler);
		System.assertEquals(false, isValid);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Testes for when a class doesn't implement ITriggerHandler.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void IsValidTriggerHandlerNotAHandler_Test()
	{
		Boolean isValid = TriggerManager.IsValidTriggerHandler(new TriggerManager());
		System.assertEquals(false, isValid);
	}
	
	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests before and after insert events.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void Insert_Test()
	{
		Account anAccount = (Account) TestFactory.createSObject(new Account(), true);
		System.assertNotEquals(null, anAccount);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests before and after update events.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void Update_Test()
	{
		Account anAccount = (Account) TestFactory.createSObject(new Account(), true);
		System.assertNotEquals(null, anAccount);

		string newAccountName = 'New Name';

		anAccount.Name = newAccountName;
		
		update anAccount;

		Account anUpdatedAccount = 
		[
			SELECT
				Id,
				Name
			FROM Account
			WHERE Name =: newAccountName
			LIMIT 1
		];
		System.assertNotEquals(null, anUpdatedAccount);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests before and after delete events.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void Delete_Test()
	{
		Account anAccount = (Account) TestFactory.createSObject(new Account(), true);
		System.assertNotEquals(null, anAccount);

		delete anAccount;

		Account deletedAccount = 
		[
			SELECT
				Id,
				IsDeleted
			FROM Account
			WHERE Id =: anAccount.Id
			ALL ROWS
		];
		System.assertEquals(deletedAccount.IsDeleted, true);
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Tests after undelete event.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	@IsTest
	static void Undelete_Test()
	{
		Account anAccount = (Account) TestFactory.createSObject(new Account(), true);
		System.assertNotEquals(null, anAccount);

		delete anAccount;
		
		Account deletedAccount = 
		[
			SELECT
				Id,
				IsDeleted
			FROM Account
			WHERE Id =: anAccount.Id
			ALL ROWS
		];
		System.assertEquals(deletedAccount.IsDeleted, true);

		undelete deletedAccount;
		
		Account undeletedAccount = 
		[
			SELECT
				Id,
				IsDeleted
			FROM Account
			WHERE Id =: deletedAccount.Id
		];
		System.assertEquals(undeletedAccount.IsDeleted, false);
	}
}