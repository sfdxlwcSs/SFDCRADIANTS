trigger TestEventTrigger on Test_Event__e ( after insert ) {
    System.debug('Trigger Executed');
    /*for( Test_Event__e ev : Trigger.New){
        System.debug('^**** ev ***** \n '+ev);
    }*/
}