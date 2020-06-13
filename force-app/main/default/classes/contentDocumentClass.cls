public class contentDocumentClass {
    
    @AuraEnabled
    public static void getList(){
         List<ContentDocument>  lstDocu=new List<ContentDocument>();
         lstDocu=[Select Id,OwnerId,ParentId,Title from ContentDocument where OwnerId=:UserInfo.getUserId()];
    }

}