@isTest
private class CheckSecretInformationTest {
	
	@isTest static void createCaseWithSecretInfo() {
		// 1. Create or update a case
		// 2. Case subject cant begin with "Warning"
		// 3. Case description can not be null
		// 4. Case description should contain a secret keyword
		Case myCase = new Case(
			Subject = 'HELP!!',
			Description = 'My bodyweight is 180 pounds'
		);
		insert myCase;
		
		System.debug('Case ' + myCase.Id + ' creates with description ' + myCase.Description );
	}
}