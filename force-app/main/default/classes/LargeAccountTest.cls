@isTest
private class LargeAccountTest {
    @isTest static void createLargeAccount() {
        Account acc = new Account();
        acc.Name              = 'Reed Real Estate';
        acc.NumberOfEmployees = 100;
        insert acc; 
    }
}
