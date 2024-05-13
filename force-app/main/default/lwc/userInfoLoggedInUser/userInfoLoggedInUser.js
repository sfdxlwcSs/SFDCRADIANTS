/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 26-02-2023
 * @last modified by  : Somnath Sharma
 * Modifications Log 
 * Ver   Date         Author           Modification
 * 1.0   08-06-2021   Somnath Sharma   Initial Version
**/
import { LightningElement, wire } from 'lwc';
// importing to get the record details based on record id
import { getRecord } from 'lightning/uiRecordApi';

// impoting USER id
import USER_ID from '@salesforce/user/Id';
export default class UserInfoLoggedInUser extends LightningElement {

    objUser = {};
    // using wire service getting current user data
    @wire(getRecord, {
        recordId: USER_ID,
        fields: ['User.UserRole.Name', 'User.FirstName', 'User.LastName', 'User.Name', 'User.Email', 'User.IsActive', 'User.Profile.Name']
    })
    userData({ error, data }) {
        if (data) {
            console.log('dataUser-wire called ====> ' + JSON.stringify(data));

            let objCurrentData = data.fields;

            this.objUser = {
                FirstName: objCurrentData.FirstName.value,
                LastName: objCurrentData.LastName.value,
                Name: objCurrentData.Name.value,
                Email: 'mailto:' + objCurrentData.Email.value + '?subject=Cyber Security Alert',
                IsActive: objCurrentData.IsActive.value,
                Profile: objCurrentData.Profile.displayValue,
                Role: objCurrentData.UserRole.displayValue,
            }
            this.dispatchEvent(new CustomEvent('wireprovisioned ', { detail: data }))
        }
        else if (error) {
            console.log('error ====> ' + JSON.stringify(error))
        }
    }

    constructor() {
        super();
        console.log('utility constructor call');
    }
    connectedCallback() {
        console.log('utility connected callback call');
    }
}