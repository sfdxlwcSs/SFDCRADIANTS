/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 16-11-2022
 * @last modified by  : Somnath Sharma
**/
import { LightningElement, api,wire } from 'lwc';
import firsttemp from './firsttemp.html';
import secondtemp from './secondtemp.html';
import parentHtML from './lifeCycleOfCmpParent.html';
import getSingleAccount from '@salesforce/apex/Trailclass.getSingleAccount';

export default class LifeCycleOfCmpParent extends LightningElement {

    @api temp = 'temp1';
    @api sample = 'hello';
    recId='0012v00003PrGDJAA3';
    account;
    errormessage;

    @wire(getSingleAccount, {accId : '$recId'})
    wiredSingleAccount({data, error}){
        console.log('Wire Data'+JSON.stringify(data));
       
        if(data){
            console.log('I am wire called');
            this.account = data;
            this.errormessage = undefined;
        }else if(error){
            this.account = undefined;
            this.errormessage = error.body.message;
        }
    }

    constructor() {
        super();
        console.log('parent constructor call-1');
    }
    connectedCallback() {
        console.log('parent connected callback call-2');
    }
    renderedCallback() {
        console.log('PARENT renderedCallback CALLED');
    }
    disconnectedCallback() {
        console.log('parent disconnected  call back');
    }

    // //The returned value from the render() method must be a template reference, which is the imported default 
    // export from an HTML file.
    render() {
        console.log('parent render method 3');
        if (this.temp == 'temp1') {
            return parentHtML;
        }
        else if (this.temp == 'temp2') {
            return firsttemp;
        }
        else {
            return secondtemp;
        }


    }
}