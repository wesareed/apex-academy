@isTest
private class ComparableOppsTest {
    @isTest
    static void noComparablesFound() {
        //Create Account in Hospitality Industry
        Account acc  = new Account();
        acc.Name     = 'Winterfell';
        acc.Industry = 'Hospitality';
        insert acc;

        //Creat an Opportunity and associate it with the account
        Opportunity opp = new Opportunity();
        opp.Name        = 'Winterfell';
        opp.AccountId   = acc.Id;
        opp.Amount      = 100;
        opp.StageName   = 'Prospecting';
        opp.CloseDate   = Date.today();
        insert opp;

        //Query junction object for the assertion
        List <Comparable__c> comparables = [SELECT Id FROM Comparable__c WHERE Base_Opportunity__c = :opp.Id];

        //Assert there are no comparables found
        System.assertEquals(0, comparables.size());


    }

    @isTest
    static void multipleComparablesFound() {
        //Create Account in Hospitality Industry
        Account acc  = new Account();
        acc.Name     = 'Winterfell';
        acc.Industry = 'Hospitality';
        insert acc;

        //Create two opportunities that should be considered comparable
        List<Opportunity> comparableOpps = new List<Opportunity>();
        Opportunity comp1 = new Opportunity();
        comp1.Name        = 'Winterfell';
        comp1.AccountId   = acc.Id;
        comp1.Amount      = 105;
        comp1.StageName   = 'Closed Won';
        comp1.CloseDate   = Date.today().addDays(-1);
        comparableOpps.add(comp1);

        Opportunity comp2 = new Opportunity();
        comp2.Name        = 'Winterfell';
        comp2.AccountId   = acc.Id;
        comp2.Amount      = 95;
        comp2.StageName   = 'Closed Won';
        comp2.CloseDate   = Date.today().addDays(-100);
        comparableOpps.add(comp2);
        insert comparableOpps;

        //Create base opportunity
        Opportunity baseOpp = new Opportunity();
        baseOpp.Name        = 'Winterfell';
        baseOpp.AccountId   = acc.Id;
        baseOpp.Amount      = 100;
        baseOpp.StageName   = 'Prospecting';
        baseOpp.CloseDate   = Date.today();
        insert baseOpp;

        //Query junction object for the assertion
        List <Comparable__c> comparables = [SELECT Id,
                                                Comparable_Opportunity__c 
                                                FROM Comparable__c 
                                                WHERE Base_Opportunity__c = :baseOpp.Id
                                                ORDER BY Comparable_Opportunity__r.CloseDate DESC];

        //Assert that each junction objects points to the appropriate comparable opportunity
        System.assertEquals(comp1.Id, comparables.get(0).Comparable_Opportunity__c);
        System.assertEquals(comp2.Id, comparables.get(1).Comparable_Opportunity__c);
        
    }
}
