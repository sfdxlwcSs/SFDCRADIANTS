/**
 * @File Name          : navigation.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/24/2020, 9:50:03 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/24/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track,
    wire
} from 'lwc';
import {
    CurrentPageReference,
    NavigationMixin
} from 'lightning/navigation';

export default class Navigation extends NavigationMixin(LightningElement) {
    @wire(CurrentPageReference)
    pageRef;
    @track recordPageUrl;
    generateAccountsUrl() {
        // Generate a URL to a User record page
        this[NavigationMixin.GenerateUrl]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0012v00002OskZB',
                actionName: 'view',
            },
        }).then(url => {
            window.console.log('url' + url);
            window.prompt('Is This Url->' + url);
            this.recordPageUrl = url;
        });
    }

    navigateToObjectHome() {
        // Navigate to the Account home page
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home',
            },
        });
    }

}