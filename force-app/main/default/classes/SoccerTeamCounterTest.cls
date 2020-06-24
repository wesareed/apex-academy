@isTest
private class SoccerTeamCounterTest {
    @isTest static void  SoccerTeamCounterTest() {
        Account acc = new Account();
        acc.Name = 'Planted';
        acc.Soccer_Teams__c = 'Arsenal';
        insert acc;
    }
}
