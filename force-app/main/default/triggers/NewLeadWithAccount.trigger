trigger NewLeadWithAccount on Lead (after insert) {
    for(Lead l : Trigger.new){
        Account acc  = new Account();
        acc.Name     = l.LastName;
        insert acc;
    }

}