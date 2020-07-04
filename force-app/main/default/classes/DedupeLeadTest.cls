@isTest
private class DedupeLeadTest {
    @isTest
    static void createLeadNoDupes() {
        String leadOwner = UserInfo.getUserId();

        //Create all required records
        Lead myLead        = new Lead();
        myLead.FirstName   = 'Sansa';
        myLead.LastName    = 'Stark';
        myLead.Company     = 'Winterfell';
        myLead.Description = 'The North remembers';
        myLead.Email       = 'sstark@winterfell.com';
        myLead.OwnerId     = leadOwner;
        insert myLead; 

        //Use SOQL to find the latest value (only querying one value)
        Lead updatedLead = [SELECT OwnerId, Description FROM Lead WHERE Id = :myLead.Id];

        //Assert that results are as expected
            //Make sure Owner Id has not changed to the data quality queue Id
            System.assertEquals(leadOwner, updatedLead.OwnerId);

            //Make sure description is unchanged
            System.assertEquals(myLead.Description, updatedLead.Description);
    }

    @isTest
    static void createLeadMultipleDupes() {
        String email = 'sstark@winterfell.com';

        //Create two dupe Contacts
        List<Contact> dupeContacts = new List<Contact>();
        Contact firstDupe   = new Contact();
        firstDupe.FirstName = 'Sansa';
        firstDupe.LastName  = 'Stark';
        firstDupe.Email     = email;
        dupeContacts.add(firstDupe);

        Contact secondDupe   = new Contact();
        secondDupe.FirstName = 'Sansa';
        secondDupe.LastName  = 'Stark';
        secondDupe.Email     = email;
        dupeContacts.add(secondDupe);
        insert dupeContacts;

        //Create dupe lead
        Lead myLead        = new Lead();
        myLead.FirstName   = 'Sansa';
        myLead.LastName    = 'Stark';
        myLead.Company     = 'Winterfell';
        myLead.Email       = email;
        myLead.OwnerId     = UserInfo.getUserId();
        myLead.Description = 'The North remembers';
        insert myLead; 

        //Use SOQL to get the latest value of our lead
        Lead updatedLead = [SELECT OwnerId, Description FROM Lead WHERE Id = :myLead.Id];

        //Get the data quality queue info 
        Group dataQualityQueue = [SELECT Id FROM Group WHERE DeveloperName = 'Data_Quality' LIMIT 1];

        //Make assertions
            //Asert that the lead owner is the data quality queue 
            System.assertEquals(dataQualityQueue.Id, updatedLead.OwnerId);

            //Assert the lead descriptions contains dupe contact ID's
            System.assert(updatedLead.Description.contains(firstDupe.Id));
            System.assert(updatedLead.Description.contains(secondDupe.Id));
    }
}
