trigger LeadKeyFieldsPopulated on Lead (before insert) {
    for(Lead l : Trigger.new){
        
        //List<String> fields = new List<String>();
        //fields.add(l.FirstName);
        //fields.add(l.LastName);
        //fields.add(l.Phone);
        //fields.add(l.Email);
        //fields.add(l.Website);
        //fields.add(l.Title);

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
        //for(String field : fields){
            //if(String.isNotBlank(field)){
                //count = count + 1;
                //l.Key_Fields_Populated__c = count;
                //populatedFields.add(field);
            //}
        //}

        //List<String> labels = new List<String>();
        //labels.add(Schema.Lead.fields.FirstName.getDescribe().getLabel());
        //labels.add(Schema.Lead.fields.LastName.getDescribe().getLabel());
        //labels.add(Schema.Lead.fields.Phone.getDescribe().getLabel());
        //labels.add(Schema.Lead.fields.Email.getDescribe().getLabel());
        //labels.add(Schema.Lead.fields.Website.getDescribe().getLabel());
        //labels.add(Schema.Lead.fields.Title.getDescribe().getLabel());
        
        //Step 3: Create a task for each key field that is populated
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