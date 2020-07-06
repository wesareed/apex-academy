trigger CaseContactOwner on Case (after insert) {
    //Criteria: Write a trigger that sets the contact owner to whomever most 
    //recently created a case on the record 
    for(Case myCase : Trigger.new) {
        //Make sure there is a contact
        if(myCase.ContactId != null){

            //Find the contact for updating
            Contact myCon = [SELECT Id FROM Contact WHERE Id = :myCase.ContactId];

            //Update the contact - needs DML bc where in an after trigger
            myCon.OwnerId = myCase.CreatedById;
            update myCon;
        }
    }
}