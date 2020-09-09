trigger dynamicTestAcc on Account (after insert,after update) {
    
 TriggerHandlerDynamic.determinesObjectTypeHandler(trigger.new,trigger.newMap);
}