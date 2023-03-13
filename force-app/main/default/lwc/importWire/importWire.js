/**
 * @File Name          : importWire.js
 * @Description        : Use of refreshApex and Syntax for wired functions
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 13-03-2023
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/21/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    wire,
    track
} from 'lwc';
import getAccList from '@salesforce/apex/demoClass.getAllAccounts';
import getContactList from '@salesforce/apex/demoClass.getContactList';
import findContacts from '@salesforce/apex/demoClass.findContacts';
import {
    refreshApex
} from '@salesforce/apex';

export default class ImportWire extends LightningElement {
    @track contacts = [];
    @track error = '';
    @track contactsSearch = [];
    @track errorSearch = '';
    searchKey = 'Somnath';
    @track wiredActivities;
    @wire(getAccList) accountsCached;

    get errorMessage() {
        if (this.accountsCached.error) {
            return this.accountsCached.error.body.message;
        }
        return null;
    }

    @wire(getContactList)
    wiredContacts(
        response
    ) {
        this.wiredActivities = response;
        if (response.data) {
            this.contacts = response.data;
            this.error = undefined;
        } else if (response.error) {
            this.error = response.error;
            this.contacts = undefined;
        }
    }

    @wire(findContacts, {
        searchKey: '$searchKey'
    })

    contactsSearchResults({
        data,
        error
    }) {
        if (data) {

            this.contactsSearch = data;
            this.errorSearch = undefined;
        } else if (error) {
            this.errorSearch = error;
            this.contactsSearch = undefined;
        }
    }

    handleKeyChange(event) {

        const searchKey = event.target.value;
        this.searchKey = this.template.querySelector('[data-search]').value;

    }

    refresh() {
        // Use the value to refresh wiredGetActivityHistory().
        return refreshApex(this.wiredActivities);
    }

}