/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* A utility class to handle SObjects. 
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Michael Libman <Mike@Arketek.ca>
* @modifiedBy     Michael Libman <Mike@Arketek.ca>
* @maintainedBy   Michael Libman <Mike@Arketek.ca>
* @version        1.0
* @created        2019-04-21
* @modified       2019-04-21
* @systemLayer    Utility
* @testClass      SObject_Util_Test.cls
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* v1.0            Mike@Arketek.ca
* 2019-04-21      + Created method to create an SObject by its Schema result.
*                 + Created method to create a list of SObjects by its Schema result.
*                 + Created method to create a map of SObjects by its Schema result.
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
*/

public class SObject_Util  
{
	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Creates and returns a new instance of an SObject.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     sObjectResult    A described SObject result that will be made into an SObject.
	* @return    SObject          Returns the requested SObject type.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public static SObject CreateSObject(Schema.DescribeSObjectResult sObjectResult)
	{
		return (SObject) Type.forName(sObjectResult.getName()).newInstance();
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Creates and returns a new instance of a list of SObjects.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     sObjectResult    A described SObject result that will be made into an SObject.
	* @return    List<SObject>    Returns the requested SObject type in a list.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public static List<SObject> CreateSObjectList(Schema.DescribeSObjectResult sObjectResult)
	{
		string sObjectTypeValue = 'List<' + sObjectResult.getName() + '>';

		return (List<SObject>) Type.forName(sObjectTypeValue).newInstance();
	}

	/**
	* ───────────────────────────────────────────────────────────────────────────────────────────────┐
	* Creates and returns a new instance of a map of SObjects organized by Ids.
	* ────────────────────────────────────────────────────────────────────────────────────────────────
	* @param     sObjectResult       A described SObject result that will be made into an SObject.
	* @return    Map<Id, SObject>    Returns the requested SObject type in a map organized by Ids.
	* ───────────────────────────────────────────────────────────────────────────────────────────────┘
	*/
	public static Map<Id, SObject> CreateSObjectMap(Schema.DescribeSObjectResult sObjectResult)
	{
		string sObjectTypeValue = 'Map<Id, ' + sObjectResult.getName() + '>';

		return (Map<Id, SObject>) Type.forName(sObjectTypeValue).newInstance();
	}
}