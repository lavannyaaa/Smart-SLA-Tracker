@IsTest
private class ProductServiceIntegrationTest {
    @IsTest
    static void testGetPostDetails() {
        // Register mock response
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        Test.startTest();
        String responseBody = ProductServiceIntegration.getPostDetails(1);
        Test.stopTest();

        // Verify the mock response matches exactly
        String expected = '{"userId": 1, "id": 1, "title": "Mock Title", "body": "Mock Body"}';
        System.assertEquals(expected, responseBody);
    }

    // Mock generator simulating the external API
    public class MockHttpResponseGenerator implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"userId": 1, "id": 1, "title": "Mock Title", "body": "Mock Body"}');
            res.setStatusCode(200);
            return res;
        }
    }
}
