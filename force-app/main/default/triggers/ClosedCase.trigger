trigger ClosedCase on Case (before insert) {
    for(Case myCase : Trigger.new){
        if(myCase.ContactId != null){
            List<Case> casesToday = [SELECT Id 
                                        FROM Case 
                                        WHERE ContactId = :myCase.ContactId 
                                        AND CreatedDate = TODAY];

            if(casesToday.size() >= 2){
                myCase.Status = 'Closed';
            }
        }
    }
}