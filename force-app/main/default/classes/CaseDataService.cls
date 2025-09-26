public with sharing class CaseDataService {
    @AuraEnabled(cacheable=true)
    public static Integer getHighPriorityCaseCount() {
        return [SELECT count() FROM Case WHERE Priority = 'High'];
    }
}