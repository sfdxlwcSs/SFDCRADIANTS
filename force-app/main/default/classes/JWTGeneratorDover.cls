/*
This Apex code implements the Salesforce JWT Bearer Flow,
a method for server-to-server authorization without needing a user to log in interactively.
Essentially, the "LWC org" is programmatically logging into the "MIAW org" to fetch data.
*/
public class JWTGeneratorDover {
    public static String generateJWT() {
        Auth.JWT jwt = new Auth.JWT();
        //USERNAME FROM TARGET ORG
        jwt.setSub('ssharma4@dovercorp.com.hr.miaw'); //MIAW Org is the Resource/Target Server and 
        //LWC org is the requesting/Source Server
        jwt.setAud('https://test.salesforce.com');
        //This is the Consumer Key from the Connected App that you created in the target ("MIAW") org. It uniquely identifies your source application.
        jwt.setIss('3MVG9jc2comIGIyyvJcS4aqOCuOFPfnAv0JNUwPQaXwvEobMkLrY4jZSpI6tEUjVWQXP29PP0AXpAtUtVmQc1');
        
        /*** 
The 'salesforcejwt2' certificate exists in two parts that are linked cryptographically: a private key and a public key.

Here’s how they are used:

Source Org (Where the Apex code runs): This org holds the complete certificate, which includes the secret private key. 
The line new Auth.JWS(jwt, 'salesforcejwt2') uses this private key to create a unique digital signature for the JWT. 
This key is never shared and is kept secure within your source org.

Target Org (Where the Connected App is): You upload only the public key of the certificate to the Connected App's configuration. 
The public key can't sign anything, but it has a special mathematical relationship with the private key that allows it to verify a signature created by it.

The Big Picture: A Digital Handshake 🤝

Think of it like this:

The source org "signs" the JWT with its secret private key, which is like an unforgeable signature.

It sends the signed JWT to the target org.

The target org's Connected App looks at the signature and uses the public key it has on file to check it.

If the public key successfully verifies the signature, the target org knows with certainty that the JWT came from the trusted source org and hasn't been altered.
It then grants the access token.

So, while it's the same certificate, each side uses a different part of it for its specific role: one to sign and the other to verify.
This asymmetric key setup is the foundation of trust for the entire JWT Bearer Flow.
This line creates a JSON Web Signature (JWS). It takes the jwt object created above and 
signs it using the private key of the certificate named 'salesforcejwt2'. 
This certificate must be uploaded in the Certificate and Key Management section of your source org's Setup.
**/
        // Create the object that signs the JWT bearer token
        Auth.JWS jws = new Auth.JWS(jwt, 'salesforcejwt2');//Certificate keystore name--salesforcejwt2 present in this org[Private Key]
        String token = jws.getCompactSerialization();
        System.debug(token);
        String tokenEndpoint ='https://test.salesforce.com/services/oauth2/token';
        //POST the JWT bearer token
        Auth.JWTBearerTokenExchange bearer = new Auth.JWTBearerTokenExchange(tokenEndpoint, jws);
        
        //Get the access token
        String accessToken = (String)bearer.getAccessToken();
        System.debug('Access Token✈-->'+accessToken);
        System.debug('getJWS() Token✈-->'+bearer.getJWS());
        System.debug('getHttpResponse()🚀-->'+bearer.getHttpResponse());
        String endpoint='https://dover2--miaw.sandbox.my.salesforce.com';
        fetchAccountDetails(accessToken,endpoint);
        return token;
        
        
    }
    
    public static void fetchAccountDetails(String accessToken,String endPoint) {
        
        String accountId = '001ba000007VSljAAG';
        
        HttpResponse response = AccountInfoFetcher.getAccountInfo(accessToken, accountId,endPoint);
        
    }
}