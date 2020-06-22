trigger Dedupe on Account (after insert) {
    for (Account acc : Trigger.new) {
        Case c = new Case();
        c.Subject       = 'Dedupe this account';
        c.OwnerId       = '0054R000009zjZjQAI';
        c.AccountId     = acc.Id; 
        insert c; 
    }
}