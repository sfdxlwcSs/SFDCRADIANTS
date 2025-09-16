/**
 * @description       : This Apex REST class exposes a GET endpoint to retrieve Account information.
 * @author            : Gemini
 * @group             : 
 * @last modified on  : 08-21-2025
 * @last modified by  : Gemini
 * * To use this endpoint, an external system would make a GET request to a URL like:
 * https://<YourSalesforceInstance>.my.salesforce.com/services/apexrest/AccountInfo/<AccountId>?name=<AccountName>&rating=<AccountRating>
 * * Example:
 * https://yourdomain.my.salesforce.com/services/apexrest/AccountInfo/0015j00000AbCdEfGHI?name=ExampleCorp&rating=Hot
 */
@RestResource(urlMapping='/AccountInfo/*')
global with sharing class AccountInfoService {

    /**
     * @description Handles incoming GET requests to retrieve account details.
     * It queries for an account based on the ID passed in the URL and the name and rating passed as query parameters.
     */
    @HttpGet
    global static void getAccountInfo() {
        // Get the RestContext to access request and response objects.
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        // The Account ID is expected to be the last part of the request URI.
        // Example: /services/apexrest/AccountInfo/0015j00000AbCdEfGHI
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
        
        // The Account Name and Rating are expected as URL query parameters.
        // Example: ?name=ExampleCorp&rating=Hot
        String accountName = request.params.get('name');
        String accountRating = request.params.get('rating');

        // --- Input Validation ---
        // Check if the Account ID was provided in the URL.
        if (String.isBlank(accountId)) {
            response.statusCode = 400; // Bad Request
            response.responseBody = Blob.valueOf(JSON.serialize(new Map<String, String>{'error' => 'Account ID is missing. Please provide it in the URL.'}));
            return;
        }

        // Check if the Account Name was provided as a parameter.
        if (String.isBlank(accountName)) {
            response.statusCode = 400; // Bad Request
            response.responseBody = Blob.valueOf(JSON.serialize(new Map<String, String>{'error' => 'Account Name is missing. Please provide it as a URL parameter.'}));
            return;
        }
        
        // Check if the Account Rating was provided as a parameter.
        if (String.isBlank(accountRating)) {
            response.statusCode = 400; // Bad Request
            response.responseBody = Blob.valueOf(JSON.serialize(new Map<String, String>{'error' => 'Account Rating is missing. Please provide it as a URL parameter.'}));
            return;
        }

        try {
            // --- SOQL Query ---
            // Query for the account using the provided ID, Name, and Rating for a specific match.
            // We are fetching Id, Name, and Rating as requested, plus a few other common fields.
            List<Account> accounts = [
                SELECT Id, Name, Rating, Industry, Phone, AnnualRevenue, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry
                FROM Account 
                WHERE Id = :accountId AND Name = :accountName AND Rating = :accountRating
                LIMIT 1
            ];

            // --- Response Handling ---
            // Check if an account was found.
            if (!accounts.isEmpty()) {
                // If found, set the status code to 200 (OK).
                response.statusCode = 200;
                // Salesforce automatically serializes the sObject into a JSON string.
                response.responseBody = Blob.valueOf(JSON.serialize(accounts[0]));
            } else {
                // If no account matches, return a 404 (Not Found) error.
                response.statusCode = 404;
                Map<String, String> errorResponse = new Map<String, String>{
                    'error' => 'Account not found.',
                    'message' => 'No account found with the specified ID, Name, and Rating.'
                };
                response.responseBody = Blob.valueOf(JSON.serialize(errorResponse));
            }
        } catch (Exception e) {
            // --- Exception Handling ---
            // If any other error occurs (e.g., a query exception), return a 500 (Internal Server Error).
            response.statusCode = 500;
            Map<String, String> errorResponse = new Map<String, String>{
                'error' => 'An unexpected error occurred.',
                'message' => e.getMessage()
            };
            response.responseBody = Blob.valueOf(JSON.serialize(errorResponse));
        }
    }
}