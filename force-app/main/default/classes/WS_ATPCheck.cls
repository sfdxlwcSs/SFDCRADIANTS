/**
 * @File Name          : WS_ATP_Check.cls
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 03-23-2022
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 
 **/
public with sharing class WS_ATPCheck {

    // public static String authenticateWithAPIGEE() {
    //     HttpRequest req = new HttpRequest();
    //     req.setEndpoint('callout:APIGEE/token');
    //     req.setMethod('POST');
    //     req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
    //     String payload = 'grant_type=client_credentials';
    //     req.setBody(payload);
    //     Http http = new Http();
    //     HTTPResponse res = http.send(req);
    //     Map < String, Object > deserializedMap = (Map < String, Object > ) JSON.deserializeUntyped(res.getBody());
    //     if (deserializedMap.containsKey('access_token')) {
    //         System.debug('deserializedMap.get(access_toke)--->' + deserializedMap.get('access_token'));
    //         return String.valueOf(deserializedMap.get('access_token'));
    //     }
    //     return null;

    // }

    // public static ResponseWrapper sendRequest(String jsonRequest, String endpoint) {
    //     if (String.isEmpty(jsonRequest) || String.isEmpty(endpoint)) {
    //         return null;
    //     }
    //     ResponseWrapper resWrapper = new ResponseWrapper();
    //     String accessToken = authenticateWithAPIGEE();
    //     System.debug('jsonRequest--->' + jsonRequest);
    //     HttpRequest req = new HttpRequest();
    //     req.setHeader('Authorization', 'Bearer ' + accessToken);
    //     req.setHeader('Content-Type', 'application/json');
    //     req.setBody(jsonRequest);
    //     req.setEndpoint(endpoint);
    //     req.setMethod('POST');
    //     req.setHeader('X-SE-ApplicationName', 'BFS');
    //     req.setTimeout(WS_ATP_ConstantClass.TIMEOUT_PARAM);

    //     HTTPResponse response = (new Http()).send(req);
    //     resWrapper.statusCode = response.getStatusCode();
    //     // AP_FS_ExceptionCreationUtility.logSingleException(additionalInfo, entityName, webServiceDataIfAny, stackTrace, recordTypeDeveloperName, statusCode, externalIdentifier)
    //     resWrapper.payload = response.getBody();
    //     resWrapper.jsonRequest = jsonRequest;
    //     System.debug('resWrapper.payload--->' + resWrapper.payload);
    //     return resWrapper;

    // }

    // /**
    //  * @description :to perform ATP Check
    //  * @author Somnath Sharma | 4/2/2020 
    //  * @param lineItems 
    //  * @param partOrder 
    //  * @return // 
    //  **/
    // @AuraEnabled
    // public static String performATPCheckForSelectedRows(String lineItems) {
    //     System.debug('lineItem' + lineItems);
    //     String endpoint = '';
    //     if (Test.isRunningTest()) {
    //         endpoint = 'https://api.dev.se.com/v1/fulfillment/spp/spare-parts-order-planning/plan';
    //     } else {
    //         endpoint = AP_WSEndPointUri.GetServiceUri('BAXTER');
    //     }
    //     RequestWrapper reqWrapper = (RequestWrapper) JSON.deserialize(lineItems, RequestWrapper.class);
    //     system.debug('reqWrapper'+reqWrapper.line);
    //     ResponseWrapper resWrapper = sendRequest(JSON.serialize(reqWrapper), endpoint);
    //     resWrapper.shipToPlantIdMap = addStockingPlantId(resWrapper);
    //     resWrapper.dslLookup = checkDSLlookup(resWrapper);
    //     return JSON.serialize(resWrapper);
    // }

    // public static Map < String, Id > addStockingPlantId(ResponseWrapper resWrapper) {
    //     Set < String > setStockingLocations = new Set < String > ();
    //     Map < String, Id > mapPlantNameAndId = new Map < String, Id > ();
    //     if (String.isNotEmpty(resWrapper.payload)) {
    //         RequestWrapper reqWrapper = (RequestWrapper) JSON.deserialize(resWrapper.payload, RequestWrapper.class);
    //         if (reqWrapper.line != null && !reqWrapper.line.isEmpty()) {
    //             for (LineRequestWrapper linereq: reqWrapper.line) {
    //                 if (String.isNotEmpty(linereq.stockingLocation)) {
    //                     setStockingLocations.add(linereq.stockingLocation);
    //                 }
    //             }
    //             for (Plant__c plantRec: [SELECT Id, Name FROM Plant__c WHERE Name IN: setStockingLocations]) {
    //                 mapPlantNameAndId.put(plantRec.Name, plantRec.Id);
    //             }
    //         }
    //     }
    //     return mapPlantNameAndId;

    // }
    // public static Boolean checkDSLlookup(ResponseWrapper resWrapper) {
    //     Boolean dslLookupFinalValue = true;
    //     if (String.isNotEmpty(resWrapper.payload)) {
    //         RequestWrapper reqWrapper = (RequestWrapper) JSON.deserialize(resWrapper.payload, RequestWrapper.class);
    //         if (reqWrapper.line != null && !reqWrapper.line.isEmpty()) {
    //             for (LineRequestWrapper linereq: reqWrapper.line) {
    //                 dslLookupFinalValue &= linereq.dslLookup;
    //                 if (dslLookupFinalValue == false) {
    //                     break;
    //                 }
    //             }
    //         }
    //     }
    //     return dslLookupFinalValue;
    // }

    // public class RequestWrapper {
    //     public String corrId;
    //     public String backOfficeCountry;
    //     public String backOfficeSystem;
    //     public String contractId;
    //     public String WOBackOfficeReference;
    //     public String orderType;
    //     public ShipToRequestWrapper shipTo;
    //     public List < LineRequestWrapper > line;
    // }

    // public class ShipToRequestWrapper {

    //     public String city;
    //     public String stateProvince;
    //     public String postalCode;
    //     public String countryCode;
    // }
    // public class LineRequestWrapper {
    //     public String lineId;
    //     public String part;
    //     public String crossRefSourceSystem;
    //     public String crossRefTargetSystem;
    //     public Integer quantity;
    //     public String requestedDate;
    //     public String stockingLocation;
    //     // public String shipFromPlantID;
    //     public String partOrderType;
    //     public Boolean searchForRefurbished;
    //     public String serviceLevel;
    //     //public String productId;
    //     public Boolean dslLookup;
    // }
    // public class ResponseWrapper {
    //     public Integer statusCode;
    //     /**response received */
    //     public String payload;
    //     /**request sent */
    //     public String jsonRequest;
    //     public Map < String, Id > shiptoPlantIdMap;
    //     /**derieved value */
    //     public Boolean dslLookup;
    // }
}