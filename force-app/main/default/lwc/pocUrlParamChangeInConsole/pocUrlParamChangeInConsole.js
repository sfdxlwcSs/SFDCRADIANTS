import { LightningElement, wire,api } from 'lwc';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';
export default class PocUrlParamChangeInConsole extends NavigationMixin(LightningElement) {

    currentPageReference = null; 
    urlStateParameters = null;

  
     @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
       if (currentPageReference) {
          this.urlStateParameters = currentPageReference.state;
          console.log('url Param'+JSON.stringify(this.urlStateParameters));
        //  this.setParametersBasedOnUrl();
       }
    }
    

    connectedCallback() {

        // alert(' this.connected = true;');  
        this.connected = true;
        console.log(' href => ' + window.location.href);
        console.log(' host => ' + window.location.host);
        console.log(' hostname => ' + window.location.hostname);
        console.log(' port => ' + window.location.port);
        console.log(' protocol => ' + window.location.protocol);
        console.log(' pathname => ' + window.location.pathname);
        console.log(' hashpathname => ' + window.location.hash);
        console.log(' search=> ' + window.location.search);
        

    }

    renderedCallback() {
        alert(1);
       //this._pathname=window.location.pathname;
    }
  
}