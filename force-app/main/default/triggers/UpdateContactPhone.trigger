trigger UpdateContactPhone on Account (before update) {
    //Criteria: When an account phone number is updated, all related contacts must have their
    //'Other Phone' field updated to the same number
    for(Account acc : Trigger.new){
        if(acc.Phone != null) {
            //Get related Contacts
            List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :acc.Id];

            //Loop through and update each contacts phone
            for(Contact con : contacts){
                con.OtherPhone = acc.Phone; 
            }
            update contacts; 
        }
    }
}