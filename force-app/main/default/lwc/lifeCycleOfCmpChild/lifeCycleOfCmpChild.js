/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 16-11-2022
 * @last modified by  : Somnath Sharma
**/
import { LightningElement } from 'lwc';

export default class LifeCycleOfCmpChild extends LightningElement {
    constructor(){
        super();
        console.log('child constructor call 4');
    }
    connectedCallback(){
        console.log('child connected callback 5');
    }
    renderedCallback(){
        console.log('child render callback');
    }
}