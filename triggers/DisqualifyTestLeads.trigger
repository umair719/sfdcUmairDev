/**
 * Created by umair on 2/25/18.
 */

trigger DisqualifyTestLeads on Lead (before insert) {
    for (Lead myLead : Trigger.new) {
        if (myLead.FirstName.toLowerCase() == 'test' || myLead.LastName.toLowerCase() == 'test') {
            System.debug('pattern match found');
            myLead.Status = 'Disqualified';
        }
    }
}