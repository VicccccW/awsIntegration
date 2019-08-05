trigger OpportunityTrigger on Opportunity (before insert
                                          , before update
                                          , before delete
                                          , after insert
                                          , after update
                                          , after delete
                                          , after undelete) {
                                          // verify if triggers are disabled
                                          //if(!GlobalUtility.isTriggerDisabled(String.valueOf(Opportunity.sObjectType))){     
                                              //OpportunityLineItem handler dispatches appropriate event
                                              OpportunityTriggerHandler.execute();  
                                          //}//end - if(!GlobalUtility)
}