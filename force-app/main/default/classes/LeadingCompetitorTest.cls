@isTest
private class LeadingCompetitorTest {
    @isTest static void createOppWithCompetitors() {
        //Create opportunity and set required fields
        Opportunity opp = new Opportunity();
        opp.Name = 'Big Deal';
        opp.CloseDate = Date.today();
        opp.StageName = 'Prospecting';

        //Set competitor price fields
        opp.Competitor_1_Price__c = 10000;
        opp.Competitor_2_Price__c = 5000; 
        opp.Competitor_3_Price__c = 7000;
        
        //Set competitor fields
        opp.Competitor_1__c = 'Amazon';
        opp.Competitor_2__c = 'Salesforce';
        opp.Competitor_3__c = 'Google';
        insert opp;

        //Update competitor one 
        opp.Competitor_1__c = 'Microsoft';
        update opp;
    }
}
