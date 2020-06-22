@isTest
public class WarrantySummaryTest {
    
    @isTest static void  createCase() {
        Case myCase                             = new Case();
        myCase.Status                           = 'Working';
        myCase.Origin                           = 'Phone';
        myCase.Product_Total_Warranty_Days__c   = 30;
        myCase.Product_Purchase_Date__c         = Date.today().addDays(-20);
        myCase.Product_Has_Extended_Warranty__c = True;
        insert myCase;
    }

}