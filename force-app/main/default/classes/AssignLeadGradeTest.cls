@isTest
public class AssignLeadGradeTest {
    @isTest static void createLead() {
        Lead myLead      = new Lead();
        myLead.FirstName = 'Bert';
        myLead.LastName  = 'Sherbert';
        myLead.Company   = 'Orange Sherbert';
        myLead.Status    = 'Open - Not Contacted';
        myLead.Score__c  = 95;
        insert myLead; 
        
        myLead.Score__c = 100;
        update myLead;
    }
}