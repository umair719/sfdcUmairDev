public class ProgramFlowExperiment {
    
    public static Integer emailCounter = 0;
    
    private void SendEmail(){
        emailCounter++;
        System.debug('Queueing email to send');
    }
    
    public void SendQueueEmails(){
        System.debug('Sending Email queue');
    }

    public void HandleContactUpdateTrigger(List<Contact>newList, Map<ID, Contact> oldMap){
        for (Contact ct: newList) {
            if (ct.OwnerID != oldMap.get(ct.ID).OwnerID){
                SendEmail();
            }
        }
        SendQueueEmails();
    }
}