public class TriggerManager_Helper {
	// Method to check if an object is a valid trigger handler
    public static Boolean isValidTriggerHandler(ITriggerHandler handler) {
		if (handler == null) {
			return false;
		}

		return true;
	}
}
