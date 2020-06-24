@isTest
private class MultiTaskCreatorTest {
    @isTest static void createAccountWithMultiTasks() {
        Account acc = new Account();
        acc.Name = 'Kettlebells';
        acc.Soccer_Teams__c = 'Arsenal';
        insert acc; 
    }
}
