trigger CreateAccountContact on Account (after insert) {
    String lastName  = 'Jones';
    String firstName = 'Bob';

    List<Contact> contacts = new List<Contact>();
    for(Account acc : Trigger.new){
        for(integer i = 0; i < 2; i++){
            Contact bob = new Contact();
            bob.AccountId = acc.Id;
            bob.LastName  = lastName;
            bob.FirstName = firstName; 

            contacts.add(bob);
        }
        insert contacts; 
    }

}