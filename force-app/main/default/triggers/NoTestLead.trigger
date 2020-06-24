trigger NoTestLead on Lead (before insert, before update) {
    
    String testValue = 'test';
    List<Lead> leadsToDisqualify = new List<Lead>();

    for(Lead l : Trigger.new) {
        if(l.FirstName == testValue && l.FirstName != null || l.LastName == testValue && l.LastName != null){
            leadsToDisqualify.add(l);
        }
    }

    for(Lead dql : leadsToDisqualify) {
        dql.Status = 'Disqualified';
    }
}