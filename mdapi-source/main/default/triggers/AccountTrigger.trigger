trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete)   {
    ITriggerHandler handler = null;

    if (Test.isRunningTest()) {
        handler = new EmptyTriggerHandler();
    }

    TriggerManager.dispatch(handler);
}