@isTest
private class CallableContactsTest {
    @isTest static void noCallableContacts() {
        //Create an Account
        Account acc = new Account();
        acc.Name    = 'Winterfell';
        insert acc;

        //Create a contact without a phone number
        Contact myCon   = new Contact();
        myCon.FirstName = 'Sansa';
        myCon.LastName  = 'Stark';
        myCon.AccountId = acc.Id;
        insert myCon;
        
        //Use SOQL to get the latest version of the contact
        Contact updatedContact = [SELECT Id, Phone FROM Contact WHERE Id = :myCon.Id];

        //Assert that the account has no callable contacts
        System.assertEquals(null, updatedContact.Phone);

    }

    @isTest static void multipleCallableContacts() {
        //Create an Account
        Account acc = new Account();
        acc.Name    = 'Winterfell';
        insert acc;
        
        //Create two contacts with a phone number
        List<Contact> myContacts = new List<Contact>();
        Contact myCon1   = new Contact();
        myCon1.FirstName = 'Sansa';
        myCon1.LastName  = 'Stark';
        myCon1.Phone     = '1234567890';
        myCon1.AccountId = acc.Id;
        myContacts.add(myCon1);

        Contact myCon2   = new Contact();
        myCon2.FirstName = 'Tywin';
        myCon2.LastName  = 'Lannister';
        myCon2.Phone     = '6171234567';
        myCon2.AccountId = acc.Id;
        myContacts.add(myCon2);
        insert myContacts; 

        acc.NumberOfEmployees = 99; 
        update acc; 
    
        //Use SOQL to get the most updated Account info
        Account updatedAccount = [SELECT Id, Name, Callable_Contacts__c FROM Account WHERE Id = :acc.Id];

        //Assert Callable Contacts field is equal to 2
        System.assertEquals(2, updatedAccount.Callable_Contacts__c);

    }
}
