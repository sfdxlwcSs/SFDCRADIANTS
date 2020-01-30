public class ProfileClass {
  @AuraEnabled(cacheable=true)
public static String getProfileInfo(){
  try{
    String profileId = UserInfo.getProfileId();
    String profileName = [SELECT Id, Name FROM Profile WHERE Id =:profileId].Name;
    return profileName;
  }catch(Exception e){
    throw new AuraHandledException(e.getMessage()); 
  }
}
}