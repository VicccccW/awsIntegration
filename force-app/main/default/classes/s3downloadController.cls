public class s3downloadController {
    @AuraEnabled
    public static Opportunity getOpportunity(Id id) {
        Opportunity opportunity = [
            SELECT Id, Account.Name, Name, CloseDate,
            Amount, Description, StageName, s3key__c, s3filename__c,
            s3bucket__c, S3_Archival_URL__c
            FROM Opportunity
            WHERE Id =: id
        ];
        return opportunity;
    }
}