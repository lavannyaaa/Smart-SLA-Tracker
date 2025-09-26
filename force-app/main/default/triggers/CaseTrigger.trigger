trigger CaseTrigger on Case (before insert, before update) {
    if (Trigger.isBefore) {
        SLACalculationService.calculateDueDate(Trigger.new);
    }
}