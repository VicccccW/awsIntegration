/*
* @Helper OpportunityTriggerHelper : Trigger helper class for trigger OpportunityTrigger. 
*                                    Methods in this class are despatched from OpportunityTriggerHandler
* @author: Sushant Verma
* @company : Open Universities Australia - Bluewolf, an IBM company.
* @createdDate : 21-JUL-2017
*/
public with sharing class OpportunityTriggerHelper {

    public static Boolean isBeforeUpdateFirstRun = true;
    public static Boolean isAfterUpdateFirstRun = true;
    private Id nullId = null;

    //static block for pre-processing
    static {
      
    }

    //This method is used to avoid recursion for before update scenario
    public static Boolean isFirstRunBefore() {
        Boolean retVal;
        if(isBeforeUpdateFirstRun) {
            retVal = true;
            isBeforeUpdateFirstRun = false;
        } else {
            retVal = isBeforeUpdateFirstRun;
        }
        return retVal;
    }

    //This method is used to avoid recursion for after update scenario
    public static Boolean isFirstRunAfter() {
        Boolean retAfterUpdateVal;
        if(isAfterUpdateFirstRun) {
            retAfterUpdateVal = true;
            isAfterUpdateFirstRun = false;
        } else {
            retAfterUpdateVal = isAfterUpdateFirstRun;
        }
        return retAfterUpdateVal;
    }

    public void sendEventToAWS(Map<Id, Opportunity> newOppsMap) {

    }

}