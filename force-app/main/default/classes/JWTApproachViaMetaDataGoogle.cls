/* PLEASE NOTE THIS IS A CLASSS COPIED FROM GOOGLE TO SEE MANUALLY FORMATION OF JWT PAYLOAD USING CRYPTO CLASS WITH RSA256 ALGORITHM  */
public with sharing class JWTApproachViaMetaDataGoogle {
     @AuraEnabled
    public static String getJwtToken(){
        String header ='{"kid": "YoutubeMIAWUserSetupVerificationKid","typ": "JWT","alg": "RS256"}';
        Long issueAt = DateTime.now().getTime()/1000;
        Long expiry = DateTime.now().addHours(1).getTime()/1000;
        Map<String,Object> claims = new Map<String,Object>();
        if('guest'.equalsIgnoreCase(Userinfo.getUserType())) {
            claims.put('sub',UUID.randomUUID().toString());
        } else {
            claims.put('sub',UserInfo.getUserEmail());
        }
        
        claims.put('iss','MIAWUserSetupVerificationIssuer');
        claims.put('exp',expiry);
        claims.put('iat',issueAt);
        
        String payload = JSON.serialize(claims);
        String encodedHeader = EncodingUtil.base64Encode(Blob.valueOf(header)).replace('+','-').replace('/','_').replaceAll('=+$','');
        String encodedPayload = EncodingUtil.base64Encode(Blob.valueOf(payload)).replace('+','-').replace('/','_').replaceAll('=+$','');
        String token = encodedHeader+'.'+encodedPayload;
        
        //String privateKey = '-----BEGIN PRIVATE KEY-----\n';
          String privateKey ='MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCSaOHPLtV5c6WA/bOlXap5HGphREeCEHasKVKWaf37veQYQnmSwxEKiXWFLd8zI3Ipnil0tz+b8DYgCUinC/PCXDwWscWmHsWILYAMkDLU9yXS47BdzHyy23ra6JZGMcveuXxvH/CR0Wc8XJMt3xSBhacb7HkgN8RUCa3+KRxeBKhL+jN+v4sqhX5+Xk7UPF2KMnnm1VpsC2qkC1okIojkYFf+PTqcD8yjsJZzUGiQ9pdDP9OIoHkzJr7HeZPRxgH053GN/cm6GTi3dT6whLcRkSkmXJcsnkmmxR3n3A2iOmRl6c5iK9DV5WVUBz0XL/bq8iCl1kFMqRnPH0LkbnTXAgMBAAECggEAImYuF+WjFoQLcMErAkF9mjMI8419V5vSpiSXWOvSVuGIxAJqWgcm69jcGcxrUrKTUh/tEZU0hsjrjp9fyI/QV+wf2h0umRdFxfcazNjceJkQ8/m3KHKxIbzboq9fD2MHyW6/Q8S3WyteHBqMIgz13nCukKsA0ocHw876aGr0VUpbrEbfpUkPDRHJ6CmGSKRmvuFYB0vZ0zW9ZbB0FwSUqb3ahqGQJh0ylP6Ks7gZFDeVvsvkE9E9vg7uAYYTmWhXFoTR6C32uaOh7LqqVbpu84qr+4A+/qFdkbvPD2iBllHIz4ztYsK49SDgh9I5L2ON2lA3F7qlUp3IVGLk1imwEQKBgQDOzZlfXhJ+T093cBtO5Y9oaQcRYdL/MMlxLQPCyznBZ6jO5I4EwUo+bVUm8jM6I7CByiVg/sOGwW0BnGpxPPKtRYQzyt40Dhkym0Ki/5O9UNC1xAbS3TqFHa2dFSXk8UaBYz4tPxAiVIgoEBtrL7JxnsFePzPjCso6uyXbzbpITQKBgQC1PUv7QvI09HfILcKLHlikm3+vRGeFT0g3MD2YOHp1HnEJ8K8yiOseHqnpw6LWX24m7GyQIwdh+uAChbvBh7E9fq0mvGAkqHgzU1n1sf4ZNXgjNoGd4/uWuwMS6HcIKG8ptpipJ+T9A3p5AYGZaslYgriZkcxpzsUvk3jEaCkDswKBgB5nRawqpWdie5lgpvMjdsDv5/UbP6z63DLCXnIt9JDFj6DTIzn5vNOOuV0fcH6Urqd2M6ad7dsK5t68wz1gq4Dj3nrK0X4vsG6rOtHB51OG5RhD+IjZs3fMlDCq4kZVXns5PvPh+JpDeT0CmTVZ7s8beuxDOHqhpHeb+gXlqgRlAoGADVUOAtTA5n5ZVWNwXTWFRc6ejPEWQGs9n7mvvkPhVj5ACIApEymZSiTtUOHwV567hqd7sPqyr1V6JxVZY3os4p4v9JqE5A10kin+gyFt1MLnLIf07v13Y3YsWra5EuOOkd35yu/BW49m8gHXW8bMOvOaysk75UitnrtVdfVHlxsCgYBgynwnIxI6iol//FqqblTekOi+dsOxwQ1S/RmwYaK6nrBQZ66+z3MbNNdWLdlc7dvRsw2pcI7SklhMddKGXAaLYlGkmsrBG65o9EuQeTJE99yEDPT1etBxRap5wTozP/Vc9D762PQ1QQuamt8TAa/LcQGRY7Z1yRqzputXA+iBIg==';
         //privateKey =privateKey	+'\n-----END PRIVATE KEY-----';
        System.debug('Key>>>'+privateKey);
        Blob signature = Crypto.sign('RSA-SHA256',Blob.valueOf(token),EncodingUtil.base64Decode(privateKey));
        //Blob signature = Crypto.sign('RSA-SHA256',Blob.valueOf(token),Certificate.getPrivateKey('MIAWUserSetupVerification'));
        String encodedSignature = EncodingUtil.base64Encode(signature).replace('+','-').replace('/','_').replaceAll('=+$','');
        System.debug(token+'.'+encodedSignature);
        return token+'.'+encodedSignature;
    }
}