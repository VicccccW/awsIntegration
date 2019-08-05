public with sharing class OpportunityTriggerHandler {
    private static OpportunityTriggerHelper OpportunityHelperUtil; 
    
    //Execute method which is invoked from OpportunityLineItem trigger
    public static void execute(){
        OpportunityHelperUtil = new OpportunityTriggerHelper();
        // Check for event type of trigger
        if(Trigger.isBefore ){
            beforeHandler();        // invoke of before handler
        }
        else if(Trigger.isAfter ){
            afterHandler();
        }
    }
    
    /*
    * @description       This method is before handler for after events invoked by execute method.                       
    * @param             NA 
    * @return            Void
    * @throws            NA
    */  
    private static void beforeHandler(){
        if(Trigger.isInsert){
            // Methods to be invoked for before insert event
        }
        else if(Trigger.isUpdate && OpportunityTriggerHelper.isFirstRunBefore()){
            // Methods to be invoked for before update event
        }
    }
    
    /*
    * @description       This method is after handler for after events invoked by execute method.                       
    * @param             NA 
    * @return            Void
    * @throws            NA
    */  
    private static void afterHandler(){
        
        //Trigger.newMap: A map of IDs to the new versions of the sObject records.
        //This map is only available in before update, after insert, after update, and after undelete triggers.

        if(Trigger.isInsert){
            // Methods to be invoked for after insert event
            OpportunityHelperUtil.sendEventToAWS((Map<Id, Opportunity>)Trigger.newMap);
        }       
        else if(Trigger.isUpdate && OpportunityTriggerHelper.isFirstRunAfter()){
            // Methods to be invoked for after update event 
            OpportunityHelperUtil.sendEventToAWS((Map<Id, Opportunity>)Trigger.newMap);
        }
    }
}