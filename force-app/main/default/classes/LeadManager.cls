global class LeadManager {
    webservice static string createNewLead(string leadFirstName,string leadLastName,string LeadCompanyName,string leadEmail,string leadphone){
        try{
            Lead ld = new lead();
            ld.FirstName = leadFirstName;
            ld.LastName = leadLastName;
            ld.Company  = LeadCompanyName;
            ld.Email    = leadEmail;
            ld.Phone    = leadphone;
            insert ld;
            return ld.id;
        }
        catch(exception ex){
            return 'Error during processing';
        }
    }
}