trigger NoTestLead on Lead (before insert, before update) {
    
    String testValue = 'test';

    for(Lead l : Trigger.new) {
        if(l.FirstName != null && l.FirstName.equalsIgnoreCase(testValue) && l.LastName != null && l.LastName.equalsIgnoreCase(testValue)){
            l.Status = 'Disqualified';
        }
    }
}