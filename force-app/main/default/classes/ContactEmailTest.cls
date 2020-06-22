@isTest
public class ContactEmailTest {
    @isTest static void createContact() {
        Contact c = new Contact();
        c.FirstName = 'Kisanet';
        c.LastName  = 'Rahwa-Reed';
        insert c;
    }
}