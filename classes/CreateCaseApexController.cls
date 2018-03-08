/**
 * Created by umair on 2/11/18.
 */

public with sharing class CreateCaseApexController {
    @AuraEnabled
    public static Contact getContactDB(Id contactId) {
        // perform isAccessible() checks here
        return [SELECT Id, Name, AccountId FROM Contact WHERE Id = :contactId];
    }

    @AuraEnabled
    public static Case newCaseDB(Case caseObj, Id contactId, Id accountId) {
        // perform isAccessiable() and isUpdatable() checks here
        caseObj.AccountId = accountId;
        caseObj.ContactId = contactId;
        update caseObj;
        return caseObj;
    }
}