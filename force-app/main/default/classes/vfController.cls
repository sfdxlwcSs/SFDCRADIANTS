public class vfController {
   public boolean disableButton {get;set;}
    
    public vfController(){
        disableButton=false;
        System.debug('came here');
    }
    
    public PageReference submit() {
        
          return null;
    }
    
      public void disableButtonMethod(){
          if(disableButton){
              disableButton=true;
          }
          else{
               disableButton=false;
          }
        
    }
}