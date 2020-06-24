trigger LargeAccount on Account (after insert) {
    for(Account acc : Trigger.new) {
        if(acc.NumberOfEmployees != null && acc.NumberOfEmployees > 99) {
            List<Opportunity> largeAccountOpps = new List<Opportunity>();
            for(Integer i = 0; i < 10; i++){
                Opportunity opp = new Opportunity();
                opp.AccountId = acc.Id; 
                opp.Name      = 'Really Big Deal';
                opp.CloseDate = Date.today(); 
                opp.StageName = 'Prospecting';
                largeAccountOpps.add(opp);
            }
            insert largeAccountOpps; 
        }
    }
}