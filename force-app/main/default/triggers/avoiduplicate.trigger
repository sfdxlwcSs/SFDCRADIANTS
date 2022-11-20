/**
* @description       : Write a trigger on lead to prevent duplicate records based on lead email,
 if a record already created with the same Email, Or record is Updated. 
 The trigger should throw an error.
* @author            : Somnath Sharma
* @group             : 
* @last modified on  : 11-19-2021
* @last modified by  : Somnath Sharma
**/
trigger avoiduplicate  on Contact (before insert) {
    
    List<Contact> existingDbLeads=new List<Contact>();
    Map<String, Contact> contactMap = new Map<String, Contact>();
    List<Contact> newListCon=new List<Contact>();
    Set<String> incomingEmailIds=new Set<String>();
    Map<String,Integer> emailPerLeadCount=new Map<String,Integer>();
    for(Contact c:Trigger.New){
        
        // CHECK IF 2 NEW LEADS WITH SAME EMAIL ID THEN THROW ERROR
        if(emailPerLeadCount.containsKey(c.Email)){
            //UNECESSARY STATEMENT
            emailPerLeadCount.put(c.Email,emailPerLeadCount.get(c.Email)+1);
            c.addError('MORE THAN ONE CONTACT WITH SAME EMAIL ID --**'+c.Email+'**');
        }
        else{
            emailPerLeadCount.put(c?.Email, 1);
        }   
    }
    existingDbLeads=[Select Id,Email,Name From contact Where Email IN:emailPerLeadCount.keySet()];
    //duplicate exists
    if(!existingDbLeads.isEmpty()) { 
        for(Contact c:Trigger.New){
            if(emailPerLeadCount.containsKey(c.Email)){
                c.Email.addError('Duplicate Contact With Email present in System --**'+c.Email);
            }
           
        } 
    }
    
}