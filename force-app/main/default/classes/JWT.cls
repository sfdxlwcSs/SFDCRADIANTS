public class JWT {
    public String alg {get; set;}
    public String iss {get; set;}
    public String sub {get; set;}
    public String aud {get; set;}
    public String exp {get; set;}
    public String iat {get; set;}
    public String pk {get; set;}
    public Integer validFor {get; set;}

    public JWT(String alg) {
        this.alg = alg;
        this.validFor = 3600;
    }
    
    public String assertion(){
         String jwt = '';
        JSONGenerator header = JSON.createGenerator(false);
        header.writeStartObject();
        header.writeStringField('alg', this.alg);
        header.writeEndObject();
        String encodedHeader = base64URLencode(Blob.valueOf(header.getAsString()));
        
        JSONGenerator body = JSON.createGenerator(false);
        body.writeStartObject();
        body.writeStringField('iss', this.iss);
        body.writeStringField('sub', this.sub);
        body.writeStringField('aud', this.aud);
        Long rightNow = (dateTime.now().getTime()/1000)+1;
        body.writeNumberField('iat', rightNow);
        body.writeNumberField('exp', (rightNow + validFor));
        body.writeEndObject();
        jwt = encodedHeader + '.' + base64URLencode(Blob.valueOf(body.getAsString()));
        
        //Sign in with private key
        Blob signature = null;
        Blob privateKey = EncodingUtil.base64Decode(pk);
        signature = Crypto.sign('rsa-sha256', Blob.valueOf(jwt), privateKey);
            
        jwt += '.' + base64URLencode(signature);  
        return jwt;
        
    }
    
     public String base64URLencode(Blob input){ 
        String output = encodingUtil.base64Encode(input);
        output = output.replace('+', '-');
        output = output.replace('/', '_');
        while ( output.endsWith('=')){
            output = output.subString(0,output.length()-1);
        }
        return output;
    }
}