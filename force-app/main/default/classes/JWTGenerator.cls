/**JWTBearerTokenExchange and JWT Class
 * 
 * JWT Class
Generates the JSON Claims Set in a JSON Web Token (JWT). The resulting Base64-encoded payload can be passed as an argument to create an instance of the Auth.JWS class.
* JWTBearerTokenExchange
Contains methods that POST the signed JWT bearer token to a token endpoint to request an access token, in the OAuth 2.0 JWT bearer token flow.
Use the methods in this class to post a signed JWT bearer token to the OAuth token endpoint, in exchange for an access token.
In the following example application, the Apex controller:
Creates the JSON Claims Set.
Specifies the scope of the request with additional claims.
Creates the signed JWT.
Specifies the token endpoint and POSTs to it.
Gets the access token from the HTTP response.
https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Auth_JWT.htm
Link:https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Auth_JWTBearerTokenExchange.htm#apex_Auth_JWTBearerTokenExchange_constructors
**/
public class JWTGenerator {
    public static String generateJWT() {
        Auth.JWT jwt = new Auth.JWT();
        jwt.setSub('somnath90_integrationorg@gmail.com'); //Integration Org is the Resource Server and 
        //LWC org is the requesting Server
        jwt.setAud('https://login.salesforce.com');
        jwt.setIss('3MVG9pRzvMkjMb6m2OUUNA2cEccKYZ6ssUNehLRovId3MXcKNnF6GKFkG8MOpiOT40aEjFSflMrNyCMhSFQ3N');
        
        // Set the validity length (e.g., 900 seconds for 15 minutes)
        //  jwt.setValidityLength(900);
        
        // Set additional claims including 'exp'
        //  Map<String, Object> additionalClaims = new Map<String, Object>();
        //  Long currentTime = DateTime.now().getTime() / 1000; // Current time in seconds
        //  Long expTime = currentTime + 900; // 15 minutes from now in seconds
        //   additionalClaims.put('iat', currentTime); // Issued at time
        // additionalClaims.put('exp', expTime); // Expiration time
        //  jwt.setAdditionalClaims(additionalClaims);
        
        // Create the object that signs the JWT bearer token
        Auth.JWS jws = new Auth.JWS(jwt, 'salesforcejwt');//Certificate keystore name--salesforcejwt
        String token = jws.getCompactSerialization();
        System.debug(token);
        String tokenEndpoint ='https://login.salesforce.com/services/oauth2/token';
        //POST the JWT bearer token
        Auth.JWTBearerTokenExchange bearer = new Auth.JWTBearerTokenExchange(tokenEndpoint, jws);
        
        //Get the access token
      String accessToken = (String)bearer.getAccessToken();
        System.debug('Access Token✈-->'+accessToken);
                System.debug('getJWS() Token✈-->'+bearer.getJWS());
        System.debug('getHttpResponse()🚀-->'+bearer.getHttpResponse());
                fetchAccountDetails(accessToken);
     return token;
        
        
    }
    
     public static void fetchAccountDetails(String accessToken) {
       
        String accountId = '0015j00001UrtSjAAJ';
        
        HttpResponse response = AccountInfoFetcher.getAccountInfo(accessToken, accountId);
       
    }
}