@isTest
public class HelloWorldTest {
    @isTest static void updateLead() {
        Lead myLead = new Lead();
        myLead.FirstName = 'Wes';
        myLead.LastName  = 'Reed';
        myLead.Company   = 'HTN Consulting';
        insert myLead;

        myLead.Company   = 'Google';
        update myLead;
    }
}