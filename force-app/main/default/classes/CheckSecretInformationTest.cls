@isTest
private class CheckSecretInformationTest {
    @isTest static void  createCaseWithSecretInfo() {
        //Create a new case and set fields
        Case myCase = new Case();
        myCase.Subject     = 'HELP.';
        myCase.Description = 'My bodyweight is too much.';
        insert myCase; 
    }
}
