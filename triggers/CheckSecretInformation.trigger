trigger CheckSecretInformation on Case (after insert, before update) {
    
    Set<String> secretKeywords = new Set<String>();
    secretKeywords.add('Credit Card');
    secretKeywords.add('Social Security');
    secretKeywords.add('SSN');
    secretKeywords.add('Passport');
    secretKeywords.add('Bodyweight');

    String childCaseSubject = 'Warning: Parent case may contain secret info!';

    // Step 2: Check to see if our case contains any of the secret keywords
    Map<String, List<String>> problemCases = new Map<String, List<String>>();
    Map<String, Case> casesWithSecretInfo = new Map<String, Case>();

    for (Case myCase : Trigger.new) {
        // System.debug('Processing Case ID: ' + myCase.Id);
        if (myCase.Subject != childCaseSubject) {
            // System.debug('Case found which is not already a child case');
            for (String keyword : secretKeywords) {
                if (myCase.Description != null && myCase.Description.containsIgnoreCase(keyword)) {
                    if (!problemCases.containsKey(myCase.Id)) {
                        // System.debug('Case is not found in the Map, adding it');
                        problemCases.put(myCase.Id, new List<String>());  
                    }
                    // System.debug('Adding keyword to the Map: ' + myCase.Id + ' : ' + keyword );
                    problemCases.get(myCase.Id).add(keyword);
                    casesWithSecretInfo.put(myCase.Id, myCase);
                }
            }
        }
    }


    // System.debug(problemCases);

    // Step 3: If our case contains a secret keyword, create a child case
    for (Id key : casesWithSecretInfo.keySet()) {
        System.debug(casesWithSecretInfo.get(key));
        Case childCase = new Case();
        childCase.subject = childCaseSubject;
        childCase.ParentId = casesWithSecretInfo.get(key).Id;
        childCase.Origin = casesWithSecretInfo.get(key).Origin;
        childCase.IsEscalated = true;
        childCase.Priority = 'High';
        childCase.Description = 'At least one of the following keywords were found ' + string.join(problemCases.get(key), ', ') + ' in Case ID: ' + casesWithSecretInfo.get(key).CaseNumber;
        //casesToInsert.add(childCase);
        insert childCase;
    }

    //insert casesToInsert;
}