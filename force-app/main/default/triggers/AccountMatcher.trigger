trigger AccountMatcher on Contact (before insert) {
    //Criteria: move new contacts to the matching accounts based on domain. Contact email domain should
    //match the account website domain.(Ex. jon@snow.com matches only to an account with a www.snow.com website)
    for(Contact con : Trigger.new) {
        if(con.Email != null){
            //Construct a website from the email domain
            String domain = con.Email.split('@').get(1);
            String website = 'www.' + domain;
            System.debug('Matching ' + con.FirstName + ' to website: ' + website);

            List<Account> matchingAccounts = [SELECT Id FROM Account WHERE website = :website];

            //If there is exactly one match...move the contact
            if(matchingAccounts.size() == 1){
                con.AccountId = matchingAccounts.get(0).Id;
            }
        }
    }
}