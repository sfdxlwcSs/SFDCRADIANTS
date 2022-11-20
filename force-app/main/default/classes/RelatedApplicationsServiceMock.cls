@isTest
global class RelatedApplicationsServiceMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(
    '{"status": "Success",'+
    '"statusCode": 200,'+
    '"result": {'+
        '"applicationsFound": 3,'+
        '"applications": ['+
            '{"loanId": "1000200357","creationDate": "2020-02-27T00:00:00","ssn": "647163396","applicationStatus": "Funded","stageName": "Funded","sourceName": "SALESFORCE"},'+
            '{"loanId": "4957671","creationDate": "2020-02-12T00:00:00","ssn": "647163396","applicationStatus": "Perm-Denied","sourceName": "P1"},'+
            '{"loanId": "4970090","creationDate": "2020-02-27T00:00:00","ssn": "647163396","applicationStatus": "Perm-Denied","sourceName": "P1"}]}}');
        response.setStatusCode(200);
        return response; 
    }
}