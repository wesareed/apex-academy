@isTest
private class LeadKeyFieldsPopulatedTest {
    @isTest static void createLead() {
        Lead l = new Lead();
        l.FirstName = 'Allen';
        l.LastName  = 'Iverson';
        l.Company   = 'Sixers';
        l.Email     = 'test@test.com';
        l.Phone     = '1234567890';
        l.Website   = 'www.ai.com';
        l.Title     = 'Cross Over King';
        l.Bypass_Triggers__c = false; 
    }
}
