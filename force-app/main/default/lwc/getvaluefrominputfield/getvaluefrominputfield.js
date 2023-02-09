/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 09-02-2023
 * @last modified by  : Somnath Sharma
**/
import { LightningElement } from 'lwc';

export default class Getvaluefrominputfield extends LightningElement {

    emailvalue = "username@example.com";
    mobilevalue = "000-000-0000";
    handleEmailChange(event) {
        this.emailvalue = event.target.value;
    }

    handleMobileChange(event) {
        this.mobilevalue = event.target.value;
    }

    handleClick(event) {
        alert('email ' + this.emailvalue);
        alert('Mobile ' + this.mobilevalue);
    }
}