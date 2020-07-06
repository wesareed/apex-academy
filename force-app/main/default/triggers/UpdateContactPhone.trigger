trigger UpdateContactPhone on Account (before update) {
    //Criteria: When an account phone number is updated, all related contacts must have their
    //'Other Phone' field updated to the same number
    //Extra Credit: Do not update the contact's phone number if its country doesn't match the account's
    for(Account acc : Trigger.new){
        if(acc.Phone != null) {
            //Get related Contacts
            List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :acc.Id];

            //Loop through and update each contacts phone if country's match
            for(Contact con : contacts){
                if(acc.BillingCountry != con.MailingCountry){
                    break;
                }
                else if(con.MailingCountry != null) {
                    con.OtherPhone = acc.Phone; 
                }
            }
            update contacts; 
        }
    }
}