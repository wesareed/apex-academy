trigger OwnerManager on Opportunity (after insert) {
    for(Opportunity opp : Trigger.new){
        //Get opporutnity with Manager Info
        Opportunity oppWithManagerInfo = [SELECT Id, Owner.ManagerId FROM Opportunity WHERE Id = :opp.Id];

        //Create the Opportunity Team Member Role
        if(oppWithManagerInfo.Owner.ManagerId != null){
            OpportunityTeamMember otm = new OpportunityTeamMember();
            otm.UserId                = oppWithManagerInfo.Owner.ManagerId;
            otm.OpportunityId         = opp.Id;
            otm.TeamMemberRole        = 'Sales Manager';
        }
    }
}