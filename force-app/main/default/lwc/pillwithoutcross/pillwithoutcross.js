import { LightningElement } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';
import MY_RESOURCE from '@salesforce/resourceUrl/myResource';

export default class Pillwithoutcross extends LightningElement {
     connectedCallback() {
        loadStyle(this, MY_RESOURCE )
            .then(() => {
                // Styles are loaded
            })
            .catch(error => {
                // Handle error
            });
    }

}