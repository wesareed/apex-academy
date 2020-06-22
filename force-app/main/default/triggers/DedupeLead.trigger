trigger DedupeLead on Lead (before insert) {
    for (Lead myLead : Trigger.new) {
        myLead.Description = 'Dedupe this lead';
    }
}