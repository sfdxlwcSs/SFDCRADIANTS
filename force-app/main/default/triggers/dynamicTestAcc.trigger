trigger dynamicTestAcc on Account (before insert,before update) {
    
 TriggerHandlerDynamic.determinesObjectTypeHandler(trigger.new,trigger.newMap);
}