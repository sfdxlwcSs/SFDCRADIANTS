import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class Hrssnavigator extends NavigationMixin(LightningElement) {
    @api recordId;
    @api sobjectname;

    connectedCallback() {
        this.navigateToViewSobjectPage();
    }

    // Navigate to View Sobject Page
    navigateToViewSobjectPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: this.sobjectname,
                actionName: 'view'
            },
        });
    }
}