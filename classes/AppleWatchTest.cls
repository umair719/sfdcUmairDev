@isTest
private class AppleWatchTest {
	
	@isTest static void test_method_one() {
		// Implement test code
		Opportunity opp = new Opportunity();
		opp.Name = 'Swift Deal';
		opp.StageName = 'Prospecting';
		opp.CloseDate = Date.today();
		insert opp;
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}