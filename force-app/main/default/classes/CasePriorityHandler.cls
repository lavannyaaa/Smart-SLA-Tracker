public class CasePriorityHandler {
    public static void setUrgentPriority(List<Case> cases) {
        // Loop through all the cases in the trigger.
        for (Case c : cases) {
            // Check if the subject contains the word 'urgent'.
            if (c.Subject != null && c.Subject.toLowerCase().contains('urgent')) {
                // Set the priority to 'High'.
                c.Priority = 'High';
            }
        }
    }
}