trigger SoccerTeamCounter on Account (before insert, before update) {
    for(Account acc : Trigger.new) {
        if(acc.Soccer_Teams__c != null){
            Integer count = acc.Soccer_Teams__c.countMatches(';') + 1;
            acc.Soccer_Teams_Counter__c = count;
        }
        else {
            acc.Soccer_Teams_Counter__c = 0;
        }
    }
}