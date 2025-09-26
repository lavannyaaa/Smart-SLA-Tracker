@IsTest
private class SLACalculationServiceTest {
    @IsTest
    static void testCalculateDueDate() {
        // Test data setup
        Product_Service__c ps = new Product_Service__c(Name = 'Test Product');
        insert ps;
        
        SLA_Rule__c rule = new SLA_Rule__c(Product_Service__c = ps.Id, Resolution_Time__c = 8); // 8 hours
        insert rule;
        
        // Test a new case
        Case testCase = new Case(Product_Service__c = ps.Id);
        Test.startTest();
        insert testCase;
        Test.stopTest();
        
        // Verify the result
        Case resultCase = [SELECT SLA_Due_Date__c FROM Case WHERE Id = :testCase.Id];
        System.assertNotEquals(null, resultCase.SLA_Due_Date__c, 'SLA Due Date should be calculated');
    }
}