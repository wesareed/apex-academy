trigger AppleWatch on Opportunity (after insert) {
    for(Opportunity opp : Trigger.new) {
        Task task        = new Task();
        task.Subject     = 'Apple Watch Promo';
        task.Description = 'Send them on ASAP';
        task.Priority    = 'High';
        task.WhatId      = opp.Id;
        insert task;
    }
}