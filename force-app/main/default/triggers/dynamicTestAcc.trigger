trigger dynamicTestAcc on Account (before update) {
    
 TriggerHandlerDynamic.determinesObjectTypeHandler(trigger.new,trigger.newMap);
}