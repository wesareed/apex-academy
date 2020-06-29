@isTest
private class NoTestLeadTest {
    @isTest static void  createLead() {
        Lead l = new Lead();

        l.FirstName = 'Test';
        l.LastName  = 'Test';
        l.Company   = 'Deloitte';
        insert l; 
    }
}
