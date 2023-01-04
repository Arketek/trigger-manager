@namespaceAccessible
public class TriggerManager {
	public class TriggerManagerException extends Exception {}

	// Static method to dispatch trigger handler method calls based on trigger context
    public static void dispatch(ITriggerHandler handler) {
        // Check if the provided object is a valid trigger handler
        if (!TriggerManager_Helper.isValidTriggerHandler(handler)) {
            throw new TriggerManagerException(handler + ' does not implement ITriggerHandler.');
        }

		if (Trigger.isBefore) {
			if (Trigger.isInsert) {
				handler.onBeforeInsert(Trigger.new);
			}
			else if (Trigger.isUpdate) {
				handler.onBeforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
			}
			else if (Trigger.isDelete) {
				handler.onBeforeDelete(Trigger.old, Trigger.oldMap);
			}
		}
		else if (Trigger.isAfter) {
			if (Trigger.isInsert) {
				handler.onAfterInsert(Trigger.new);
			}
			else if (Trigger.isUpdate) {
				handler.onAfterUpdate(Trigger.new, Trigger.old, Trigger.newMap);
			}
			else if (Trigger.isDelete) {
				handler.onAfterDelete(Trigger.old, Trigger.oldMap);
			}
			else if (Trigger.isUndelete) {
				handler.onUndelete(Trigger.new);
			}
		}
	}
}