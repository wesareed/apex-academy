@isTest
public class NewLeadWithAccountTest {
    @isTest static void createLead() {
        Lead l      = new Lead();
        l.FirstName = 'Shawn';
        l.LastName  = 'Carter';
        l.Company   = 'RocNation';
        l.Status    = 'Open - Not Contacted';
        insert l;
    }
}