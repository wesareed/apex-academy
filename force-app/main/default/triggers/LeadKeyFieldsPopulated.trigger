trigger LeadKeyFieldsPopulated on Lead (before insert) {
    for(Lead l : Trigger.new){

        //Step 1: add field labels and fields to a map
        Map<String,String> mapFields = new Map<String,String>();
        mapFields.put(Schema.Lead.fields.FirstName.getDescribe().getLabel(), l.FirstName);
        mapFields.put(Schema.Lead.fields.LastName.getDescribe().getLabel(), l.LastName);
        mapFields.put(Schema.Lead.fields.Phone.getDescribe().getLabel(), l.Phone);
        mapFields.put(Schema.Lead.fields.Email.getDescribe().getLabel(), l.Email);
        mapFields.put(Schema.Lead.fields.Website.getDescribe().getLabel(), l.Website);
        mapFields.put(Schema.Lead.fields.Title.getDescribe().getLabel(), l.Title);

        //Step2: Check if each field has a value and increase key fields populated field and add to populated fields list
        List<String> populatedFields = new List<String>();
        Integer count = 0;
        for(String field : mapFields.keySet()){
            if(String.isNotBlank(mapFields.get(field))){
                count = count + 1;
                l.Key_Fields_Populated__c = count;
                populatedFields.add(field);
            }
        }
        
        //Step 3: Create a task for each key field that is populated if key fields populated are greater than 3P
        List<Task> taskToCreate = new List<Task>();
        if(l.Key_Fields_Populated__c >= 3) {
            for(String field : populatedFields) {
                Task myTask    = new Task();
                myTask.WhatId  = l.Id; 
                myTask.Subject = 'Verify the ' + field + ' field';
                taskToCreate.add(myTask);
            }
            insert taskToCreate;
        }
    }
}