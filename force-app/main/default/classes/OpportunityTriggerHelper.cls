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
    // static {
      
    // }

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
        List<OppCRUD__e> newEvents = new List<OppCRUD__e>();

        for(Opportunity opp : newOppsMap.values()) {
            newEvents.add(createNewOppCRUDEvent(opp));
        } 

        publishEventToAWS(newEvents);
    }

    private static OppCRUD__e createNewOppCRUDEvent(Opportunity opp) {
        if(String.isBlank(opp.S3_Archival_URL__c)) {
            OppCRUD__e newEvent = new OppCRUD__e(
                OppId__c = opp.Id
            );
            return newEvent;
        }

        return null;
    }

    private static void PublishEventToAWS(List<OppCRUD__e> newEvents) {
        List<Database.SaveResult> results = EventBus.publish(newEvents);

        for(Database.SaveResult sr : results) {
            if (sr.isSuccess()) {
                System.debug('Successfully published event.');
            } else {
                for(Database.Error err : sr.getErrors()) {
                    System.debug('Error returned: ' +
                                err.getStatusCode() +
                                ' - ' +
                                err.getMessage());
                }
            }
        }
    }
}