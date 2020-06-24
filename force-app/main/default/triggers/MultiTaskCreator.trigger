trigger MultiTaskCreator on Account (after insert) {
    for(Account acc : Trigger.new){
        if(acc.Soccer_Teams__c != null){
            List<String> selectedItems = new List<String>();
            selectedItems = acc.Soccer_Teams__c.split(';');

            List<Task> tasksToCreate = new List<Task>();
            for(String item : selectedItems) {
                Task myTask = new Task();
                myTask.Subject = item;
                myTask.WhatId = acc.Id;
                tasksToCreate.add(myTask);
            }
            insert tasksToCreate;
        }
    }
}