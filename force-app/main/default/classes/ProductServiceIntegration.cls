public class ProductServiceIntegration {
    @AuraEnabled
    public static String getPostDetails(Integer postId) {
        if (postId == null) {
            return 'Error: postId is null';
        }

        HttpRequest request = new HttpRequest();
        // Use String.valueOf for clarity
        request.setEndpoint('callout:JSON_Placeholder/posts/' + String.valueOf(postId));
        request.setMethod('GET');
        // optional: set Accept header
        request.setHeader('Accept', 'application/json');

        try {
            Http http = new Http();
            HttpResponse response = http.send(request);

            if (response != null && response.getStatusCode() == 200) {
                return response.getBody();
            } else if (response != null) {
                return 'Error: Status ' + response.getStatusCode() + ' - ' + response.getBody();
            } else {
                return 'Error: null response from endpoint';
            }
        } catch (Exception ex) {
            // Log if needed: System.debug('Callout error: ' + ex);
            return 'Error: ' + ex.getMessage();
        }
    }
}
