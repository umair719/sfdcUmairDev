trigger AssignLeadGrade on Lead (before insert, before update) {
	for (Lead myLead : Trigger.new) {
		if (myLead.Score__c == 100) {
			myLead.Grade__c = 'A+';
		} else if (myLead.Score__c >= 90) {
			myLead.Grade__c = 'A';
		} else if (myLead.Score__c >= 80) {
			myLead.Grade__c = 'B';
		} else {
			myLead.Grade__c = 'F';
			myLead.Status = 'Closed - Trash';
		}
	}

	List<Lead> leadList = new List<Lead>();

	leadList.add(new Lead(FirstName = 'Hat', 	LastName = 'Girl'));
	leadList.add(new Lead(FirstName = 'Bread', 	LastName = 'Man'));
	leadList.add(new Lead(FirstName = 'The', 	LastName = 'Boss'));
	//leadList.add('Hat Girl');
	//leadList.add('Beard Man');
	//leadList.add('The Boss');

	for (Lead myLead : leadList) {
		// Set default feilds
		myLead.Status = 'Open';
		myLead.LeadSource = 'Web';

		// Ensure we don't span the Lead
		myLead.DoNotCall = true;
		myLead.HasOptedOutOfFax = true;
		myLead.HasOptedOutOfEmail = true;
	}

	for (Integer i = 1; i <= 10; i++) {
		Account acc = new Account();
		acc.Name = 'SFDC' + i;
		acc.Website = 'sfdc' + i + '.com';
		insert acc;
	}	
}