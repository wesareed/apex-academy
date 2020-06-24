@isTest
private class NoTestLeadTest {
    @isTest static void  createLead() {
        Lead l = new Lead();

        l.FirstName = 'Test';
        l.LastName  = 'Smith';
        l.Company   = 'Deloitte';
        l.Status    = 'Disqualified';
        insert l; 
    }
}
