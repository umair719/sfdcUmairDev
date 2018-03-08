trigger WarrantySummary on Case (before insert) {

	String endingStatement = 'Have a nice day!';

	for (Case myCase : Trigger.new) {
		if (myCase.Product_Purchase_Date__c != null && myCase.Product_Total_Warranty_Days__c != null && myCase.Product_Total_Warranty_Days__c != null){
		
		// Set up varibles to use in the summary field.
		String purchaseDate 		= myCase.Product_Purchase_Date__c.format();
		String createdDate 			= DateTime.now().format();
		Integer warrantyDays 		= myCase.Product_Total_Warranty_Days__c.intValue();
		Decimal warrantyPercentage 	= (100 * (myCase.Product_Purchase_Date__c.daysBetween(Date.today()) 
										/ myCase.Product_Total_Warranty_Days__c)).setScale(2);
		Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;


		// Populate summary field
		myCase.Warranty_Summary__c = 'Product purchased on ' + purchaseDate + ' '
		                             + 'and case creaetd ' + createdDate + '.\n'
		                             + 'Warranty is for ' + warrantyDays + ' '
		                             + 'days and is ' + warrantyPercentage + '% though its warranty period. \n'
		                             + 'Extended warranty: ' + hasExtendedWarranty + '\n'
		                             + endingStatement;
		}
		
	}
	

	/*
		Product purchased on <<Purchase Date>> and case created on <<Case Created Date>>,
		Warranty is for <<Warranty Total Days>> days and is <<Warranty Percentage>>% though its warranty period.
		Extended warranty: <<Has Extended Warranty>>
		Have a nice day!
	*/

}