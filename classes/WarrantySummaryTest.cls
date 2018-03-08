@isTest
private class WarrantySummaryTest {

	@isTest static void createNewCase() {
		// Implement test code
		Case c = new Case();
		c.OwnerId = UserInfo.getUserId();
		c.Status = 'New';
		c.Origin = 'Phone';
		c.Product_Purchase_Date__c = Date.today();
		c.Product_Total_Warranty_Days__c = 3;
		c.Product_Has_Extended_Warranty__c = false;
		insert c;
	}

}