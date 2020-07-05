trigger ClosedCase on Case (before insert) {
    for(Case myCase : Trigger.new){
        if(myCase.ContactId != null){
            //SOQL Query to get all cases that were created today and put in a list
            List<Case> casesToday = [SELECT Id 
                                        FROM Case 
                                        WHERE ContactId = :myCase.ContactId 
                                        AND CreatedDate = TODAY];
            //Check how many cases are in the list...if greater than or equal to 2 set the case status to closedq
            if(casesToday.size() >= 2){
                myCase.Status = 'Closed';
            }
        }
    }
}