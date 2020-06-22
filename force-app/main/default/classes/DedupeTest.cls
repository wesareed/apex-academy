@isTest
public class DedupeTest {
    @isTest static void createAccount() {
        Account acc = new Account();
        acc.Name = 'HTN Consulting';
        acc.OwnerId = '0054R000009zjZjQAI';
        insert acc; 
    }
}