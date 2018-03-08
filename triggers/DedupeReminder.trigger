trigger DedupeReminder on Account (after insert) {
	for (Account acc : trigger.new) {
		Case newCase = new Case();
		newCase.AccountId = acc.Id;
		newCase.OwnerId = '005i0000001ZECNAA4';
		newCase.Subject = 'Dedupe this Account';
		// insert newCase;
	}
}