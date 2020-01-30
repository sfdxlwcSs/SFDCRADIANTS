trigger dynamictriggerContact on Contact (before update) {
    
    TriggerHandlerDynamic.determinesObjectTypeHandler(trigger.new,trigger.newMap);
}