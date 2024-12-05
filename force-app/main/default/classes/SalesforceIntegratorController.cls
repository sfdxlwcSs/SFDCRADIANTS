/* Class form where actual flow will start*/
public class SalesforceIntegratorController {
    public static final String END_POINT = 'https://login.salesforce.com';

    public void getListViewsInfo() {
        
        Security_Key__mdt securityKey=[Select Key__c from Security_Key__mdt Where DeveloperName='Private_Key'];
        // Initialize JWT object
        JWT jwt = new JWT('RS256');
        // Assign JWT values
        jwt.iss = '3MVG9pRzvMkjMb6m2OUUNA2cEccKYZ6ssUNehLRovId3MXcKNnF6GKFkG8MOpiOT40aEjFSflMrNyCMhSFQ3N'; 
        jwt.sub = 'somnath90_integrationorg@gmail.com';
        jwt.aud = END_POINT;
        jwt.exp = String.valueOf(System.currentTimeMillis() / 1000 + 3600); // Token valid for 1 hour
        jwt.pk=securityKey.Key__c;
        
        JWTListViewsController listViewDetails=new JWTListViewsController();
        listViewDetails.getDesOrgListViewDetails(jwt);
        
    }
}