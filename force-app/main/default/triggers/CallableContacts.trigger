trigger CallableContacts on Account (before insert, before update) {
    for(Account acc : Trigger.new) {
        //Search for related Contacts
        List<Contact> callableContacts = [SELECT  Id, 
                                            Phone, 
                                            Account.Name 
                                            FROM Contact 
                                            WHERE Account.Id = :acc.Id];
        System.debug('Callable contacts found: ' + callableContacts.size());

        //For each contact, check whether the Phone Number field is filled in and increment the callable contacts field on Account
        Integer count = 0; 
        if(!callableContacts.isEmpty()) {
            for(Contact con : callableContacts) {
                if(con.Phone != null) {
                    count = count + 1;
                    acc.Callable_Contacts__c = count;
                }
            }
        }
    }
}