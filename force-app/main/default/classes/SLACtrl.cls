public with sharing class SLACtrl {
    @AuraEnabled(cacheable=true)
    public static String ping() {
        return 'SLA Controller Active';
    }
}