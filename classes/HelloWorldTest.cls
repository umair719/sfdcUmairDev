@istest
public class HelloWorldTest {

	@istest static void updateLead()
    {
        Lead myLead = new Lead();
        myLead.FirstName = 'Umair';
        myLead.LastName = 'Khalid';
        myLead.Company = 'McKesson';
        insert myLead;

        myLead.Company = 'Google';
        update myLead;
    }
}