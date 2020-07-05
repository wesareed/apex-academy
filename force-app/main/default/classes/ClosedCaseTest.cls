@isTest
private class ClosedCaseTest {
    @isTest static void noCasesToday() {
        //Create a contact
        Contact con   = new Contact();
        con.FirstName = 'Jon';
        con.LastName  = 'Snow';
        insert con;

        //Create a case
        Case myCase = new Case();
        myCase.ContactId = con.Id;
        myCase.Status    = 'New';
        insert myCase;

        //Get updated case
        Case updatedCase = [SELECT Id, Status FROM Case WHERE Id = :myCase.Id];

        //Assert the case status is new
        System.assertEquals('New', updatedCase.Status);
    }

    @isTest static void threeCasesTodayOnContact() {
        //Create a contact
        Contact con = new Contact();
        con.FirstName = 'Jon';
        con.LastName  = 'Snow';
        insert con;

        //Create two old cases
        List<Case> oldCases = new List<Case>();
        for(Integer i = 0; i < 2; i++) {
            Case oldCase      = new Case();
            oldCase.ContactId = con.Id;
            oldCases.add(oldCase);
        }
        insert oldCases;

        //Create a third (new) case
        Case myCase = new Case();
        myCase.ContactId = con.Id;
        insert myCase;

        //Get updated Case 
        Case updatedCase = [SELECT Id, Status FROM Case WHERE Id = :myCase.Id];

        //Assert the case status is closed
        System.assertEquals('Closed', updatedCase.Status);
    }
}
