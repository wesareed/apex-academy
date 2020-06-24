trigger CheckSecretInformation on Case (after insert, before update) {

    String childCaseSubject = 'Warning: Parent case may contain secret info';

    //Step 1: Create a collection containing each of our secret keywords
    Set<String> secretKeywords = new Set<String>();
    secretKeywords.add('Credit Card');
    secretKeywords.add('Social Security');
    secretKeywords.add('SSN');
    secretKeywords.add('Passport');
    secretKeywords.add('Bodyweight');
    
    //Step 2: Check to see if our case contains any of the secret keywords
    List<Case> casesWithSecretInfo = new List<Case>();
    List<String> keywordsFound = new List<String>();
    for (Case myCase : Trigger.new) {
        if (myCase.Subject != childCaseSubject) {
            for (String keyword : secretKeywords) {
                if(myCase.Description != null && myCase.Description.containsIgnoreCase(keyword)){
                    casesWithSecretInfo.add(myCase);
                    System.debug('Case ' + myCase.Id + ' include secret keyword ' + keyword);
                    break; 
                }
            }
        }
    }    
    //Step 3: If our case contains a secret keyword, create a child case
    List<Case> casesToCreate = new List<Case>();
    Set<String> foundWords = new Set<String>();
    
    

    for (Case caseWithSecretInfo : casesWithSecretInfo) {
        Case childCase = new Case();
        childCase.Subject     = childCaseSubject;
        childCase.ParentId    = caseWithSecretInfo.Id;
        childCase.IsEscalated = true;
        childCase.Priority    = 'High';
        for (Case parentCase : Trigger.new) {
            for(String foundWord : secretKeywords) {
                if(parentCase.Description.containsIgnoreCase(foundWord)) {
                    foundWords.add(foundWord);
                    //break;
                }
            }
        }
        childCase.Description = 'The following keywords were found ' + foundWords;
        //System.debug(foundWords);
        
        casesToCreate.add(childCase);
    }
    insert casesToCreate;
}